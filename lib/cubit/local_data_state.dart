part of 'local_data_cubit.dart';

@freezed
class LocalDataState with _$LocalDataState {
  const factory LocalDataState.initial() = _Initial;
  const factory LocalDataState.loading() = _Loading;
  const factory LocalDataState.loaded({
    required Box<ModelOutput> modelOutputBox,
    required Box<ModelInput> modelInputBox,
  }) = _Loaded;
}
