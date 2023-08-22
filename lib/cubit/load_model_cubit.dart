import 'package:ac_recog_app/helper/human_activity_recognition_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'load_model_state.dart';
part 'load_model_cubit.freezed.dart';

class LoadModelCubit extends Cubit<LoadModelState> {
  LoadModelCubit() : super(const LoadModelState.initial());
  void loadModel() {
    if (state is _Initial) {
      HumanActivityRecognitionHelper helper = HumanActivityRecognitionHelper();
      helper
          .initHelper()
          .then((value) => emit(LoadModelState.loaded(helper: helper)));
    }
  }

  HumanActivityRecognitionHelper getModel() {
    return (state as _Loaded).helper;
  }
}
