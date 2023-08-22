import 'package:ac_recog_app/entities/model_output.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'local_data_state.dart';
part 'local_data_cubit.freezed.dart';

class LocalDataCubit extends Cubit<LocalDataState> {
  LocalDataCubit() : super(const LocalDataState.initial());
  void loadData() async {
    if (state is _Initial) {
      var outputBox = await Hive.openBox<ModelOutput>('model_output_history');
      emit(_Loaded(box: outputBox));
    }
  }

  Box<ModelOutput> getBox() {
    return (state as _Loaded).box;
  }

  void addData({required ModelOutput output}) {
    if (state is _Loaded) {
      var currentState = (state as _Loaded);
      var box = currentState.box;
      emit(const _Initial());
      box.add(output).then(
            (value) => emit(
              currentState.copyWith(box: box),
            ),
          );
    }
  }
}
