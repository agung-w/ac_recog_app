part of 'sensor_cubit.dart';

@freezed
class SensorState with _$SensorState {
  const factory SensorState.initial(
      {required List<ModelOutput> outputHistories}) = _Initial;
  const factory SensorState.tracking(
      {required List<StreamSubscription> streamSubsriptions,
      required List<ModelOutput> outputHistories}) = _Tracking;
}
