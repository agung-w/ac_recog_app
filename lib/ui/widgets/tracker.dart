import 'package:ac_recog_app/cubit/load_model_cubit.dart';
import 'package:ac_recog_app/cubit/local_data_cubit.dart';
import 'package:ac_recog_app/cubit/login_cubit.dart';
import 'package:ac_recog_app/cubit/tracker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tracker extends StatelessWidget {
  const Tracker({super.key});
  bool? canStartBeClicked({
    required LoadModelState loadModelState,
    required LocalDataState localDataState,
    required TrackerState trackerState,
  }) {
    return loadModelState.mapOrNull(
      loaded: (value) => localDataState.mapOrNull(
        loaded: (value) => trackerState.mapOrNull(
          initial: (value) => true,
        ),
      ),
    );
  }

  bool? canStopBeClicked({
    required LocalDataState localDataState,
    required TrackerState trackerState,
  }) {
    return localDataState.mapOrNull(
      loaded: (value) => trackerState.mapOrNull(
        tracking: (value) => true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadModelCubit, LoadModelState>(
      builder: (context, loadModelState) {
        return BlocBuilder<LocalDataCubit, LocalDataState>(
          builder: (context, loadDataState) {
            return BlocBuilder<TrackerCubit, TrackerState>(
              builder: (context, sensorState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: canStartBeClicked(
                                    loadModelState: loadModelState,
                                    localDataState: loadDataState,
                                    trackerState: sensorState) !=
                                null
                            ? () {
                                context.read<TrackerCubit>().startTracking(
                                    helper: context
                                        .read<LoadModelCubit>()
                                        .getModel(),
                                    outputBox: context
                                        .read<LocalDataCubit>()
                                        .getModelOutputBox(),
                                    inputBox: context
                                        .read<LocalDataCubit>()
                                        .getModelInputBox(),
                                    localDataCubit:
                                        context.read<LocalDataCubit>(),
                                    user:
                                        context.read<LoginCubit>().getUser()!);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero, // Set this
                          padding: EdgeInsets.zero, // and this
                        ),
                        child: const Icon(Icons.play_arrow)),
                    ElevatedButton(
                        onPressed: canStopBeClicked(
                                    localDataState: loadDataState,
                                    trackerState: sensorState) !=
                                null
                            ? () {
                                context.read<TrackerCubit>().stopTracking(
                                      outputBox: context
                                          .read<LocalDataCubit>()
                                          .getModelOutputBox(),
                                      inputBox: context
                                          .read<LocalDataCubit>()
                                          .getModelInputBox(),
                                    );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero, // Set this
                          padding: EdgeInsets.zero, // and this
                        ),
                        child: const Icon(Icons.stop)),
                    ElevatedButton(
                        onPressed: canStopBeClicked(
                                    localDataState: loadDataState,
                                    trackerState: sensorState) !=
                                null
                            ? () {}
                            : null,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(24, 24), // Set this
                          padding: EdgeInsets.zero, // and this
                        ),
                        child: const Text("S")),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
