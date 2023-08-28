import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime currentTime = DateTime.now();
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      var perviousMinute =
          DateTime.now().add(const Duration(seconds: -1)).minute;
      var currentMinute = DateTime.now().minute;
      if (perviousMinute != currentMinute) {
        setState(() {
          currentTime = DateTime.now();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35,
          child: Text(
            DateFormat('HH:mm').format(currentTime).toString(),
            style: const TextStyle(
                fontFamily: 'avenir',
                fontSize: 32,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 13,
          child: Text(
            DateFormat('EEE, d MMM').format(currentTime).toString(),
            style: const TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w300,
                fontSize: 10),
          ),
        ),
      ],
    );
  }
}
