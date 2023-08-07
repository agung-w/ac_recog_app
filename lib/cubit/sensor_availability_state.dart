part of 'sensor_availability_cubit.dart';

@freezed
class SensorAvailabilityState with _$SensorAvailabilityState {
  const factory SensorAvailabilityState.unavailable({List<String>? sensors}) =
      _Unavailable;
  const factory SensorAvailabilityState.available() = _Available;
}
