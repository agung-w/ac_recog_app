import 'package:ac_recog_app/cubit/login_cubit.dart';
import 'package:ac_recog_app/cubit/sensor_availability_cubit.dart';
import 'package:ac_recog_app/cubit/summary_cubit.dart';
import 'package:ac_recog_app/ui/widgets/clock.dart';
import 'package:ac_recog_app/ui/widgets/loading_animation.dart';
import 'package:ac_recog_app/ui/widgets/tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          state.mapOrNull(
            signedIn: (value) {
              context
                  .read<SummaryCubit>()
                  .getSummary(name: value.user.name, context: context);
            },
          );

          return BlocBuilder<SensorAvailabilityCubit, SensorAvailabilityState>(
            builder: (context, state) {
              return state.map(
                available: (value) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Clock(),
                        )),
                    Expanded(flex: 1, child: Tracker()),
                    Expanded(
                      flex: 2,
                      child: SizedBox(),
                    )
                  ],
                ),
                unavailable: (value) => Center(
                  child: Text(
                    '${value.sensors?.map((e) => e)} Sensor(s) Not Detected',
                    textAlign: TextAlign.center,
                  ),
                ),
                initial: (value) => const Center(child: LoadingWidget()),
              );
            },
          );
        },
      ),
    );
  }
}
