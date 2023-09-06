import 'package:ac_recog_app/entities/motion_summary.dart';
import 'package:flutter/widgets.dart';

class SummaryChartSection {
  final Color indicatorColor;
  final int index;
  final MotionSummary motionSummary;
  SummaryChartSection({
    required this.indicatorColor,
    required this.motionSummary,
    required this.index,
  });
}
