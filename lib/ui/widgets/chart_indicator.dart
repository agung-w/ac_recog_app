import 'package:flutter/material.dart';

class ChartIndicator extends StatelessWidget {
  const ChartIndicator(
      {super.key,
      required this.color,
      required this.text,
      this.size = 14,
      this.textColor,
      required this.suffixText});
  final Color color;
  final String text;
  final String suffixText;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          flex: 10,
          child: Text(
            text,
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
            flex: 2,
            child: Center(
              child: Text(
                suffixText,
                style: TextStyle(
                  color: textColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ))
      ],
    );
  }
}
