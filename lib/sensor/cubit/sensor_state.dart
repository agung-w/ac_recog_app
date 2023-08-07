part of 'sensor_cubit.dart';

@freezed
class SensorState with _$SensorState {
  const factory SensorState.initial() = _Initial;
  const factory SensorState.tracking(
      {required List<StreamSubscription> streamSubsriptions}) = _Tracking;
}
