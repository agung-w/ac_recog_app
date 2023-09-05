import 'package:ac_recog_app/entities/user.dart';
import 'package:ac_recog_app/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial(hand: "LEFT"));
  void signIn({required BuildContext context}) {
    if (state is _Initial) {
      var currentState = (state as _Initial);
      if (currentState.username != null &&
          currentState.hand != null &&
          currentState.username!.isNotEmpty) {
        emit(_SignedIn(
            user: User(
                name: currentState.username!.toUpperCase(),
                hand: currentState.hand!)));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Home()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Please set username")));
      }
    }
  }

  User? getUser() {
    if (state is _SignedIn) {
      return (state as _SignedIn).user;
    }
    return null;
  }

  void setUsername({required String name}) {
    if (state is _Initial) {
      emit((state as _Initial).copyWith(username: name));
    }
  }

  void setHand({required String hand}) {
    if (state is _Initial) {
      emit((state as _Initial).copyWith(hand: hand));
    }
  }
}
