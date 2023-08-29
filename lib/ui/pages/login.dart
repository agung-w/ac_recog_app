import 'package:ac_recog_app/cubit/login_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Image.asset(
                    "assets/images/actrack_icon_orange.png",
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  style: const TextStyle(fontSize: 12),
                  onChanged: (value) =>
                      context.read<LoginCubit>().setUsername(name: value),
                  controller: TextEditingController(
                      text: state.mapOrNull(
                    initial: (value) => value.username,
                  )),
                  decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      hintText: "Name",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFfb5c18))),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFfb5c18)))),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]"))
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 2),
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: Color(0xFFfb5c18),
                        size: 10,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.72,
                      child: const Text(
                        "Note: Please remember the name for accessing your activity results.",
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Transform.scale(
                  scale: 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Radio(
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            activeColor: const Color(0xFFfb5c18),
                            value: "LEFT",
                            groupValue: state.mapOrNull(
                              initial: (value) => value.hand,
                            ),
                            onChanged: state.mapOrNull(
                                initial: (_) => ((value) => context
                                    .read<LoginCubit>()
                                    .setHand(hand: value.toString()))),
                          ),
                          const Text("L"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            activeColor: const Color(0xFFfb5c18),
                            value: "RIGHT",
                            groupValue: state.mapOrNull(
                              initial: (value) => value.hand,
                            ),
                            onChanged: state.mapOrNull(
                                initial: (_) => ((value) => context
                                    .read<LoginCubit>()
                                    .setHand(hand: value.toString()))),
                          ),
                          const Text("R"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: TextButton(
                  onPressed: () {
                    context.read<LoginCubit>().signIn(context: context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero, // Set this
                    padding: const EdgeInsets.symmetric(
                        vertical: 2, horizontal: 3), // and this
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Color(0xFFfb5c18)),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
