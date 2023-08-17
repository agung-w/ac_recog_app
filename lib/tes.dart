import 'package:ac_recog_app/cubit/sensor_availability_cubit.dart';
import 'package:ac_recog_app/entities/model_output.dart';
import 'package:ac_recog_app/human_activity_recognition_helper.dart';
import 'package:ac_recog_app/sensor/cubit/sensor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tes extends StatefulWidget {
  const Tes({super.key});

  @override
  State<Tes> createState() => _TesState();
}

class _TesState extends State<Tes> {
  late HumanActivityRecognitionHelper helper;
  ModelOutput? classification;
  List<ModelOutput> output = [];
  @override
  void initState() {
    super.initState();
    helper = HumanActivityRecognitionHelper();
    helper.initHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SensorAvailabilityCubit, SensorAvailabilityState>(
        builder: (context, state) {
          return state.map(
            available: (value) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<SensorCubit>()
                              .startTracking(helper: helper);
                        },
                        child: const Text("Start")),
                    ElevatedButton(
                        onPressed: () {
                          context.read<SensorCubit>().stopTracking();
                        },
                        child: const Text("Stop")),
                  ],
                ),
                BlocBuilder<SensorCubit, SensorState>(
                  builder: (context, state) {
                    return Column(
                        children: state.outputHistories
                            .map((e) => Row(
                                  children: [
                                    Text(e.result),
                                    Text(e.probability.toString()),
                                    Text(e.toHumanDate)
                                  ],
                                ))
                            .toList());
                  },
                )
              ],
            ),
            unavailable: (value) => Center(
              child: Text('${value.sensors?.map((e) => "$e ")}'),
            ),
          );
        },
      ),
    );
  }
}
