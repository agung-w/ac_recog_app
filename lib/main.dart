import 'dart:io';

import 'package:ac_recog_app/cubit/sensor_availability_cubit.dart';
import 'package:ac_recog_app/entities/model_output.dart';
import 'package:ac_recog_app/sensor/cubit/sensor_cubit.dart';
import 'package:ac_recog_app/tes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
  final Directory path = await getTemporaryDirectory();
  Hive
    ..init(path.path)
    ..registerAdapter(ModelOutputAdapter());
  Hive.openBox<ModelOutput>("model_output_history");
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SensorCubit()),
        BlocProvider(
            create: (context) => SensorAvailabilityCubit()..checkDeviceSensor())
      ],
      child: const MaterialApp(home: Tes()),
    );
  }
}
