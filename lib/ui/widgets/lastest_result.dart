import 'package:ac_recog_app/cubit/local_data_cubit.dart';
import 'package:ac_recog_app/cubit/login_cubit.dart';
import 'package:ac_recog_app/ui/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestResult extends StatelessWidget {
  const LatestResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, loginState) {
        return BlocBuilder<LocalDataCubit, LocalDataState>(
          builder: (context, state) {
            return state.map(
                loaded: (value) => Text(value.modelOutputBox.values
                        .where((element) =>
                            element.username ==
                            loginState.mapOrNull(
                              signedIn: (value) => value.user.username,
                            ))
                        .lastOrNull
                        ?.result ??
                    ""),
                initial: (value) => const Text("Cant load data"),
                loading: (value) => const Loading());
          },
        );
      },
    );
  }
}
