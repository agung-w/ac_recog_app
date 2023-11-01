import 'dart:io';

import 'package:ac_recog_app/cubit/local_data_cubit.dart';
import 'package:ac_recog_app/cubit/login_cubit.dart';
import 'package:ac_recog_app/cubit/sensor_availability_cubit.dart';
import 'package:ac_recog_app/cubit/summary_cubit.dart';
import 'package:ac_recog_app/cubit/tracker_cubit.dart';
import 'package:ac_recog_app/entities/model_input.dart';
import 'package:ac_recog_app/entities/model_output.dart';
import 'package:ac_recog_app/ui/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  runApp(const MainApp());
  final Directory path = await getTemporaryDirectory();
  Hive
    ..init(path.path)
    ..registerAdapter(ModelOutputAdapter())
    ..registerAdapter(ModelInputAdapter());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TrackerCubit()),
        BlocProvider(create: (context) => LocalDataCubit()..loadData()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SummaryCubit()),
        BlocProvider(
            create: (context) => SensorAvailabilityCubit()..checkDeviceSensor())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFfb5c18))),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedItemColor: Color(0xFFfb5c18))),
          home: const Login()),
    );
  }
}
