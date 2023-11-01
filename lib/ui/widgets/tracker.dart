import 'package:ac_recog_app/cubit/local_data_cubit.dart';
import 'package:ac_recog_app/cubit/login_cubit.dart';
import 'package:ac_recog_app/cubit/summary_cubit.dart';
import 'package:ac_recog_app/ui/pages/summary.dart';
import 'package:ac_recog_app/cubit/tracker_cubit.dart';
import 'package:ac_recog_app/ui/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tracker extends StatelessWidget {
  const Tracker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalDataCubit, LocalDataState>(
      builder: (context, loadDataState) {
        return BlocBuilder<TrackerCubit, TrackerState>(
          builder: (context, sensorState) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _StartTrackingButton(),
                _StopTrackingButton(),
                _ShowSummaryButton(),
              ],
            );
          },
        );
      },
    );
  }
}

class _StartTrackingButton extends StatelessWidget {
  const _StartTrackingButton();
  bool? canStartBeClicked({
    required LocalDataState localDataState,
    required TrackerState trackerState,
  }) {
    return localDataState.mapOrNull(
      loaded: (value) => trackerState.mapOrNull(
        initial: (value) => true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalDataCubit, LocalDataState>(
      builder: (context, localDataState) {
        return BlocBuilder<TrackerCubit, TrackerState>(
          builder: (context, trackerState) {
            return ElevatedButton(
                onPressed: canStartBeClicked(
                            localDataState: localDataState,
                            trackerState: trackerState) !=
                        null
                    ? () {
                        context.read<TrackerCubit>().startTracking(
                            outputBox: context
                                .read<LocalDataCubit>()
                                .getModelOutputBox(),
                            inputBox: context
                                .read<LocalDataCubit>()
                                .getModelInputBox(),
                            context: context,
                            user: context.read<LoginCubit>().getUser()!);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero, // Set this
                  padding: EdgeInsets.zero, // and this
                ),
                child: const Icon(Icons.play_arrow));
          },
        );
      },
    );
  }
}

class _StopTrackingButton extends StatelessWidget {
  const _StopTrackingButton();
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
    return BlocBuilder<LocalDataCubit, LocalDataState>(
      builder: (context, localDataState) {
        return BlocBuilder<TrackerCubit, TrackerState>(
          builder: (context, trackerState) {
            return ElevatedButton(
                onPressed: canStopBeClicked(
                            localDataState: localDataState,
                            trackerState: trackerState) !=
                        null
                    ? () {
                        context.read<SummaryCubit>().setStateToLoading();
                        context
                            .read<TrackerCubit>()
                            .stopTracking(
                              outputBox: context
                                  .read<LocalDataCubit>()
                                  .getModelOutputBox(),
                              inputBox: context
                                  .read<LocalDataCubit>()
                                  .getModelInputBox(),
                              context: context,
                            )
                            .then((value) => context
                                .read<SummaryCubit>()
                                .getSummary(
                                    name: context
                                        .read<LoginCubit>()
                                        .getUser()!
                                        .name,
                                    context: context));
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero, // Set this
                  padding: EdgeInsets.zero, // and this
                ),
                child: const Icon(Icons.stop));
          },
        );
      },
    );
  }
}

class _ShowSummaryButton extends StatelessWidget {
  const _ShowSummaryButton();
  bool? canBeClicked(
      {required TrackerState trackerState,
      required SummaryState summaryState}) {
    return trackerState.mapOrNull(
      initial: (value) => summaryState.mapOrNull(
        loaded: (value) => true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackerCubit, TrackerState>(
      builder: (context, trackerState) {
        return BlocBuilder<SummaryCubit, SummaryState>(
          builder: (context, summaryState) {
            return ElevatedButton(
                onPressed: canBeClicked(
                            trackerState: trackerState,
                            summaryState: summaryState) !=
                        null
                    ? () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Summary()));
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(24, 24), // Set this
                  padding: EdgeInsets.zero, // and this
                ),
                child: summaryState.mapOrNull(
                      loading: (value) => const LoadingWidget(
                        color: Colors.grey,
                      ),
                    ) ??
                    const Text("S"));
          },
        );
      },
    );
  }
}
