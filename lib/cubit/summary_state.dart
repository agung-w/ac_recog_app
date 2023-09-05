part of 'summary_cubit.dart';

@freezed
class SummaryState with _$SummaryState {
  const factory SummaryState.initial() = _Initial;
  const factory SummaryState.loading() = _Loading;
  const factory SummaryState.loaded(
      {required List<SummaryChartSection> resultList,
      required int totalDurationInSecond}) = _Loaded;
}
