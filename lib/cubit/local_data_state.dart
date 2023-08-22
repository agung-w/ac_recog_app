part of 'local_data_cubit.dart';

@freezed
class LocalDataState with _$LocalDataState {
  const factory LocalDataState.initial() = _Initial;
  const factory LocalDataState.loaded({required Box<ModelOutput> box}) =
      _Loaded;
}
