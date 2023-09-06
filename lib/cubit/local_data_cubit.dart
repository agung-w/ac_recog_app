import 'dart:async';

import 'package:ac_recog_app/entities/model_input.dart';
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
      emit(const _Loading());
      var outputBox = await Hive.openBox<ModelOutput>('model_output_history');
      var inputBox = await Hive.openBox<ModelInput>('model_input_history');
      emit(_Loaded(modelOutputBox: outputBox, modelInputBox: inputBox));
    }
  }

  Box<ModelOutput> getModelOutputBox() {
    return (state as _Loaded).modelOutputBox;
  }

  Box<ModelInput> getModelInputBox() {
    return (state as _Loaded).modelInputBox;
  }

  Future<void> saveModelResult(
      {required ModelOutput output,
      required List<ModelInput> inputList}) async {
    if (state is _Loaded) {
      var currentState = (state as _Loaded);
      var outputBox = currentState.modelOutputBox;
      var inputBox = currentState.modelInputBox;
      emit(const _Loading());
      outputBox.add(output);
      inputBox.addAll(inputList);
      emit(_Loaded(modelOutputBox: outputBox, modelInputBox: inputBox));
    }
  }
}
