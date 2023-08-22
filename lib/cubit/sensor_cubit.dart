import 'dart:async';

import 'package:ac_recog_app/cubit/local_data_cubit.dart';
import 'package:ac_recog_app/entities/model_output.dart';
import 'package:ac_recog_app/helper/human_activity_recognition_helper.dart';
import 'package:ac_recog_app/entities/sensor_data.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:motion_sensors/motion_sensors.dart';

part 'sensor_state.dart';
part 'sensor_cubit.freezed.dart';

class SensorCubit extends Cubit<SensorState> {
  SensorCubit() : super(const SensorState.initial(outputHistories: []));
  void startTracking(
      {required HumanActivityRecognitionHelper helper,
      required Box<ModelOutput> box,
      required LocalDataCubit localDataCubit}) {
    List<List<double>> sensorDataList = [];

    if (state is _Initial) {
      Vector3 accelerometer = Vector3.zero();
      Vector3 gyroscope = Vector3.zero();
      Vector3 magnetometer = Vector3.zero();
      Vector3 linearAccelerometer = Vector3.zero();
      Vector3 relativeOrientation = Vector3.zero();
      Vector3 absoluteOrientation = Vector3.zero();
      Quaternion quaternion = Quaternion.euler(0, 0, 0);
      Quaternion inverseQuaternion = Quaternion.euler(0, 0, 0);
      Vector3 gravity = Vector3.zero();
      List<StreamSubscription> streamSubsriptions = [];
      streamSubsriptions
          .add(motionSensors.gyroscope.listen((GyroscopeEvent event) {
        gyroscope.setValues(event.x, event.y, event.z);
      }));
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
        var now = DateTime.now().toUtc();
        var acSensorData = SensorData(
          timestamp: now.microsecondsSinceEpoch,
          gyroscopeX: gyroscope.x,
          gyroscopeY: gyroscope.y,
          gyroscopeZ: gyroscope.z,
          accelerometerX: accelerometer.x,
          accelerometerY: accelerometer.y,
          accelerometerZ: accelerometer.z,
          linearAccelerometerX: linearAccelerometer.x,
          linearAccelerometerY: linearAccelerometer.y,
          linearAccelerometerZ: linearAccelerometer.z,
          magnetometerX: magnetometer.x,
          magnetometerY: magnetometer.y,
          magnetometerZ: magnetometer.z,
          gravityX: gravity.x,
          gravityY: gravity.y,
          gravityZ: gravity.z,
          eulerX: degrees(absoluteOrientation.x),
          eulerY: degrees(absoluteOrientation.y),
          eulerZ: degrees(absoluteOrientation.z),
          quaternionX: quaternion.x,
          quaternionY: quaternion.y,
          quaternionZ: quaternion.z,
          quaternionW: quaternion.w,
          inverseQuaternionX: inverseQuaternion.x,
          inverseQuaternionY: inverseQuaternion.y,
          inverseQuaternionZ: inverseQuaternion.z,
          inverseQuaternionW: inverseQuaternion.w,
          relativeOrientationX: relativeOrientation.x,
          relativeOrientationY: relativeOrientation.y,
          relativeOrientationZ: relativeOrientation.z,
        );
        if (sensorDataList.length == 70) {
          _predict(
                  helper: helper,
                  input: sensorDataList,
                  localDataCubit: localDataCubit)
              .then((value) => sensorDataList.clear());
          emit(_Tracking(
              streamSubsriptions: streamSubsriptions,
              outputHistories: box.values.toList()));
        } else {
          sensorDataList.add(acSensorData.toModelInput);
        }
      }));
      emit(_Tracking(
          streamSubsriptions: streamSubsriptions,
          outputHistories: box.values.toList()));
    }
  }

  void stopTracking({required Box<ModelOutput> box}) {
    if (state is _Tracking) {
      for (var element in (state as _Tracking).streamSubsriptions) {
        element.cancel();
      }
      emit(_Initial(outputHistories: box.values.toList()));
    }
  }

  Future<void> _predict(
      {required HumanActivityRecognitionHelper helper,
      required List<List<double>> input,
      required LocalDataCubit localDataCubit}) async {
    helper
        .inference(input)
        .then((value) => localDataCubit.addData(output: value));
  }
}