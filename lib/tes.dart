import 'package:ac_recog_app/cubit/sensor_availability_cubit.dart';
import 'package:ac_recog_app/human_activity_recognition.dart';
import 'package:ac_recog_app/sensor/cubit/sensor_cubit.dart';
import 'package:ac_recog_app/sensor/entities/sensor_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class Tes extends StatefulWidget {
  const Tes({super.key});

  @override
  State<Tes> createState() => _TesState();
}

class _TesState extends State<Tes> {
  late HumanActivityRecognition har;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    har = HumanActivityRecognition();
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
                ElevatedButton(
                    onPressed: () async {
                      var box = await Hive.openBox<SensorData>('sensorDataBox');
                      // for (int i = 0; i < box.length; i++) {
                      //   print(box.get(i).toString());
                      // }
                      if (box.length > 28) {
                        List<List<double>> tes = [];
                        for (int i = 0; i < 28; i++) {
                          tes.add(box.get(i)!.toInput);
                          // print(box.get(i)?.toInput);
                        }
                        har.runinterference(tes);
                      }
                    },
                    child: const Text("TesHaR")),
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

extension on SensorData {
  List<double> get toInput {
    return [
      accelerometerX,
      linearAccelerometerX,
      gravityX,
      eulerX,
      eulerZ,
      quaternionX,
      quaternionZ,
      inverseQuaternionX,
      inverseQuaternionZ,
      relativeOrientationZ,
      magnetometerX
    ];
  }
}
