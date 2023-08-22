import 'package:ac_recog_app/cubit/load_model_cubit.dart';
import 'package:ac_recog_app/cubit/local_data_cubit.dart';
import 'package:ac_recog_app/cubit/sensor_availability_cubit.dart';
import 'package:ac_recog_app/cubit/sensor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});
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
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SensorAvailabilityCubit, SensorAvailabilityState>(
          builder: (context, state) {
            return state.map(
              available: (value) => Column(
                children: [
                  BlocBuilder<LoadModelCubit, LoadModelState>(
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
                                                  loadModelState:
                                                      loadModelState,
                                                  localDataState: loadDataState,
                                                  sensorState: sensorState) !=
                                              null
                                          ? () {
                                              context
                                                  .read<SensorCubit>()
                                                  .startTracking(
                                                      helper:
                                                          context
                                                              .read<
                                                                  LoadModelCubit>()
                                                              .getModel(),
                                                      box: context
                                                          .read<
                                                              LocalDataCubit>()
                                                          .getBox(),
                                                      localDataCubit:
                                                          context.read<
                                                              LocalDataCubit>());
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
                                              context
                                                  .read<SensorCubit>()
                                                  .stopTracking(
                                                      box: context
                                                          .read<
                                                              LocalDataCubit>()
                                                          .getBox());
                                            }
                                          : null,
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size.zero, // Set this
                                        padding: EdgeInsets.zero, // and this
                                      ),
                                      child: const Icon(Icons.stop)),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: BlocBuilder<LocalDataCubit, LocalDataState>(
                      builder: (context, state) {
                        return state.map(
                            initial: (value) => const Center(
                                child: CircularProgressIndicator()),
                            loaded: (value) => ListView(
                                padding: const EdgeInsets.only(bottom: 10),
                                children: value.box.values
                                    .toList()
                                    .reversed
                                    .map((e) => Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Center(
                                                    child: Text(
                                                        " ${e.toHumanDate}"))),
                                            Expanded(
                                                flex: 7,
                                                child: Text(
                                                  " ${e.result}",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                            Expanded(
                                              flex: 3,
                                              child: Center(
                                                child: Text(
                                                    " ${(e.probability * 100).toStringAsFixed(1)}%"),
                                              ),
                                            ),
                                          ],
                                        ))
                                    .toList()));
                      },
                    ),
                  )
                ],
              ),
              unavailable: (value) => Center(
                child: Text(
                  '${value.sensors?.map((e) => e)} Sensor(s) Not Detected',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
