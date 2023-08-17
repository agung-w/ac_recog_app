import 'dart:io';

import 'package:tflite_flutter/tflite_flutter.dart';

class HumanActivityRecognition {
  static const String _modelPath = 'assets/models/tes_right.tflite';
  late final Interpreter _interpreter;
  Tensor? inputTensor;
  Tensor? outputTensor;
  HumanActivityRecognition() {
    _loadModel();
  }

  Future<void> _loadModel() async {
    final interpreterOptions = InterpreterOptions();

    // Use XNNPACK Delegate
    if (Platform.isAndroid) {
      interpreterOptions.addDelegate(XNNPackDelegate());
    }

    // Use Metal Delegate
    if (Platform.isIOS) {
      interpreterOptions.addDelegate(GpuDelegate());
    }

    _interpreter = await Interpreter.fromAsset(_modelPath);
    // Get tensor input shape [1, 28, 11]
    inputTensor = _interpreter.getInputTensors().first;
    // Get tensor output shape [1, 9]
    outputTensor = _interpreter.getOutputTensors().first;
    print(inputTensor.toString());
    print(outputTensor.toString());
  }

  void runinterference(
    List<List<double>> sensorDataList,
  ) {
    try {
      var output = List.filled(1 * 9, 0);
      print(sensorDataList.length);
      // _interpreter.run([sensorDataList], output);
      _interpreter.run([sensorDataList], output);
      print(output.computeNumElements);
    } on Exception catch (e) {
      print(e.toString());
      throw Exception(e);
    }
    // Get tensor input shape [1, 9]

    // return output;
  }
}
