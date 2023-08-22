part of 'load_model_cubit.dart';

@freezed
class LoadModelState with _$LoadModelState {
  const factory LoadModelState.initial() = _Initial;
  const factory LoadModelState.loaded(
      {required HumanActivityRecognitionHelper helper}) = _Loaded;
}
