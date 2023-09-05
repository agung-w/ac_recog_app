import 'dart:math';

import 'package:ac_recog_app/cubit/summary_cubit.dart';
import 'package:ac_recog_app/helper/time_helper.dart';
import 'package:ac_recog_app/ui/widgets/chart_indicator.dart';
import 'package:ac_recog_app/ui/widgets/loading_animation.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height / sqrt(2);

    return Scaffold(
      body: BlocBuilder<SummaryCubit, SummaryState>(
        builder: (context, summaryState) {
          return summaryState.map(
              initial: (value) =>
                  const Center(child: Text("Cant load training summary")),
              loading: (value) => const Center(child: LoadingWidget()),
              loaded: (value) {
                if (value.resultList.isEmpty) {
                  return const Center(
                    child: Text("No recent training data"),
                  );
                } else {
                  return PageView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Transform.scale(
                        scale: 0.85,
                        child: PieChart(
                          PieChartData(
                              sections: value.resultList
                                  .map((e) => PieChartSectionData(
                                      color: e.indicatorColor,
                                      value: e.motionSummary.duration,
                                      title:
                                          "${e.motionSummary.duration.toStringAsFixed(0)}s",
                                      titleStyle: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                      showTitle: true))
                                  .toList()),
                        ),
                      ),
                      Transform.scale(
                          scale: size / MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                    children: value.resultList
                                        .map((e) => ChartIndicator(
                                            color: e.indicatorColor,
                                            text: e.motionSummary.motionName,
                                            suffixText: secondToSSorMMorHH(
                                                second: e.motionSummary.duration
                                                    .floor())))
                                        .toList()),
                              ),
                              Column(
                                children: [
                                  const Center(
                                    child: Text(
                                      "Total exercise duration",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    secondToHHMMSSformat(
                                        second: value.totalDurationInSecond),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ],
                  );
                }
              });
        },
      ),
    );
  }
}
