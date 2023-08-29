import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final double size;
  final Color color;
  const Loading(
      {super.key, this.size = 16, this.color = const Color(0xFFfb5c18)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 2,
      ),
    );
  }
}
