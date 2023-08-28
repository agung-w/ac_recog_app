import 'package:ac_recog_app/cubit/load_model_cubit.dart';
import 'package:ac_recog_app/cubit/local_data_cubit.dart';
import 'package:ac_recog_app/cubit/sensor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tracker extends StatelessWidget {
  const Tracker({super.key});
  bool? canStartBeClicked({
    required LoadModelState loadModelState,
    required LocalDataState localDataState,
    required SensorState sensorState,
  }) {
    return loadModelState.mapOrNull(
      loaded: (value) => localDataState.mapOrNull(
        loaded: (value) => sensorState.mapOrNull(
          initial: (value) => true,
        ),
      ),
    );
  }

  bool? canStopBeClicked({
    required LocalDataState localDataState,
    required SensorState sensorState,
  }) {
    return localDataState.mapOrNull(
      loaded: (value) => sensorState.mapOrNull(
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
            return BlocBuilder<SensorCubit, SensorState>(
              builder: (context, sensorState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: canStartBeClicked(
                                    loadModelState: loadModelState,
                                    localDataState: loadDataState,
                                    sensorState: sensorState) !=
                                null
                            ? () {
                                context.read<SensorCubit>().startTracking(
                                    helper: context
                                        .read<LoadModelCubit>()
                                        .getModel(),
                                    box:
                                        context.read<LocalDataCubit>().getBox(),
                                    localDataCubit:
                                        context.read<LocalDataCubit>());
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
                                    sensorState: sensorState) !=
                                null
                            ? () {
                                context.read<SensorCubit>().stopTracking(
                                    box: context
                                        .read<LocalDataCubit>()
                                        .getBox());
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
                                    sensorState: sensorState) !=
                                null
                            ? () {
                                context.read<SensorCubit>().stopTracking(
                                    box: context
                                        .read<LocalDataCubit>()
                                        .getBox());
                              }
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
