part of 'tracker_cubit.dart';

@freezed
class TrackerState with _$TrackerState {
  const factory TrackerState.initial() = _Initial;
  const factory TrackerState.tracking(
      {required List<StreamSubscription> streamSubsriptions}) = _Tracking;
}
