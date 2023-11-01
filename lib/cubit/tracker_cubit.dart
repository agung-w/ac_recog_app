import 'dart:async';

import 'package:ac_recog_app/const/model_const.dart';
import 'package:ac_recog_app/cubit/local_data_cubit.dart';
import 'package:ac_recog_app/entities/model_input.dart';
import 'package:ac_recog_app/entities/model_output.dart';
import 'package:ac_recog_app/entities/user.dart';
import 'package:ac_recog_app/helper/api_result.dart';
import 'package:ac_recog_app/helper/human_activity_recognition_helper.dart';
import 'package:ac_recog_app/repository/model_input_repository.dart';
import 'package:ac_recog_app/repository/model_output_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:vector_math/vector_math_64.dart';

part 'tracker_state.dart';
part 'tracker_cubit.freezed.dart';

class TrackerCubit extends Cubit<TrackerState> {
  TrackerCubit() : super(const TrackerState.initial());
  void startTracking(
      {required HumanActivityRecognitionHelper helper,
      required Box<ModelOutput> outputBox,
      required Box<ModelInput> inputBox,
      required BuildContext context,
      required User user}) {
    List<ModelInput> currentInputList = [];
    if (state is _Initial) {
      Vector3 accelerometer = Vector3.zero();
      Vector3 magnetometer = Vector3.zero();
      Vector3 linearAccelerometer = Vector3.zero();
      Vector3 relativeOrientation = Vector3.zero();
      Vector3 absoluteOrientation = Vector3.zero();
      Quaternion quaternion = Quaternion.euler(0, 0, 0);
      Quaternion inverseQuaternion = Quaternion.euler(0, 0, 0);
      Vector3 gravity = Vector3.zero();
      List<StreamSubscription> streamSubsriptions = [];
      streamSubsriptions
          .add(motionSensors.accelerometer.listen((AccelerometerEvent event) {
        accelerometer.setValues(event.x, event.y, event.z);
        gravity.setValues(event.x, event.y, event.z);
      }));
      streamSubsriptions.add(motionSensors.userAccelerometer
          .listen((UserAccelerometerEvent event) {
        linearAccelerometer.setValues(event.x, event.y, event.z);
      }));
      streamSubsriptions
          .add(motionSensors.magnetometer.listen((MagnetometerEvent event) {
        magnetometer.setValues(event.x, event.y, event.z);
      }));
      streamSubsriptions
          .add(motionSensors.orientation.listen((OrientationEvent event) {
        relativeOrientation.setValues(event.yaw, event.pitch, event.roll);
      }));
      streamSubsriptions.add(motionSensors.absoluteOrientation
          .listen((AbsoluteOrientationEvent event) {
        absoluteOrientation.setValues(event.yaw, event.pitch, event.roll);
        quaternion.setEuler(event.yaw, event.pitch, event.roll);
        inverseQuaternion = quaternion.inverted();
      }));
      streamSubsriptions.add(
          Stream.periodic(const Duration(microseconds: 142857)).listen((event) {
        var modelInput = ModelInput(
          accelerometerX: accelerometer.x,
          linearAccelerometerX: linearAccelerometer.x,
          magnetometerX: magnetometer.x,
          gravityX: gravity.x,
          eulerX: degrees(absoluteOrientation.x),
          eulerZ: degrees(absoluteOrientation.z),
          quaternionX: quaternion.x,
          quaternionZ: quaternion.z,
          inverseQuaternionX: inverseQuaternion.x,
          inverseQuaternionZ: inverseQuaternion.z,
          relativeOrientationZ: relativeOrientation.z,
        );
        if (currentInputList.length == modelInputLength) {
          List<ModelInput> tempList = List.from(currentInputList);
          currentInputList.clear();
          _predict(helper: helper, input: tempList, user: user).then((value) {
            List<ModelInput> inputList = List.from(currentInputList
                .map((e) => e.copyWith(timestamp: value.timestamp)));
            context
                .read<LocalDataCubit>()
                .saveModelResult(output: value, inputList: inputList);
          });
          emit(_Tracking(
            streamSubsriptions: streamSubsriptions,
          ));
        } else {
          currentInputList.add(modelInput);
        }
      }));
      emit(_Tracking(
        streamSubsriptions: streamSubsriptions,
      ));
    }
  }

  Future<void> stopTracking(
      {required Box<ModelOutput> outputBox,
      required Box<ModelInput> inputBox,
      required BuildContext context}) async {
    if (state is _Tracking) {
      for (var element in (state as _Tracking).streamSubsriptions) {
        element.cancel();
      }
      emit(const _Initial());
      ApiResult<String> outputResult = await ModelOutputRepository()
          .storeData(data: (outputBox.values.toList()));
      ApiResult<String> inputResult = await ModelInputRepository()
          .storeData(data: (inputBox.values.toList()));
      outputResult.map(
        failed: (value) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Center(child: Text(value.message))));
        },
        success: (value) {
          outputBox.clear();
        },
      );
      inputResult.map(
        failed: (value) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Center(child: Text(value.message))));
        },
        success: (value) {
          inputBox.clear();
        },
      );
    }
  }

  Future<ModelOutput> _predict(
      {required HumanActivityRecognitionHelper helper,
      required List<ModelInput> input,
      required User user}) async {
    ModelOutput modelResult =
        await helper.inference(input.map((e) => e.toList).toList(), user);
    return modelResult;
  }
}
