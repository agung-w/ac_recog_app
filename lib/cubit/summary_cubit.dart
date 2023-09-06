import 'package:ac_recog_app/entities/summary_chart_section.dart';
import 'package:ac_recog_app/helper/chart_helper.dart';
import 'package:ac_recog_app/helper/time_helper.dart';
import 'package:ac_recog_app/repository/model_output_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_state.dart';
part 'summary_cubit.freezed.dart';

class SummaryCubit extends Cubit<SummaryState> {
  SummaryCubit() : super(const SummaryState.initial());
  void getSummary({required String name, required BuildContext context}) async {
    emit(const _Loading());
    var result = await ModelOutputRepository().getTrainingSummary(
        name: name,
        startTime: getCurrentDate(),
        endTime: getCurrentDate() + 86400000);
    result.map(success: (value) {
      int totalDuration = 0;
      List<SummaryChartSection> resultList = value.value.map((e) {
        totalDuration += e.duration.round();

        return SummaryChartSection(
            indicatorColor: getIndicatorColor(e.motionName),
            motionSummary: e,
            index: getIndex(e.motionName));
      }).toList();
      resultList.sort((a, b) => a.index.compareTo(b.index));
      emit(_Loaded(
          resultList: resultList, totalDurationInSecond: totalDuration));
    }, failed: (value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Center(child: Text(value.message))));
      emit(const _Initial());
    });
  }

  void setStateToLoading() {
    emit(const _Loading());
  }
}
