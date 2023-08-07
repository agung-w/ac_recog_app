import 'package:ac_recog_app/cubit/sensor_availability_cubit.dart';
import 'package:ac_recog_app/sensor/cubit/sensor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tes extends StatelessWidget {
  const Tes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SensorAvailabilityCubit, SensorAvailabilityState>(
        builder: (context, state) {
          return state.map(
            available: (value) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<SensorCubit>().startTracking();
                    },
                    child: const Text("Start")),
                ElevatedButton(
                    onPressed: () {
                      context.read<SensorCubit>().stopTracking();
                    },
                    child: const Text("Stop")),
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
