import 'dart:isolate';

import 'package:ac_recog_app/entities/model_output.dart';
import 'package:ac_recog_app/isolate_inference.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class HumanActivityRecognitionHelper {
  static const modelPath = 'assets/models/right.tflite';

  late final Interpreter interpreter;
  late final List<String> labels;
  late final IsolateInference isolateInference;
  late Tensor inputTensor;
  late Tensor outputTensor;
  Future<void> _loadModel() async {
    final interpreterOptions = InterpreterOptions();
    optionsAddFlexDelegateAndroid(interpreterOptions);
    interpreter =
        await Interpreter.fromAsset(modelPath, options: interpreterOptions);
    // Get tensor input shape [1, 28, 11]
    inputTensor = interpreter.getInputTensors().first;
    // Get tensor output shape [1, 9]
    outputTensor = interpreter.getOutputTensors().first;
  }

  Future<void> initHelper() async {
    _loadModel();
    isolateInference = IsolateInference();
    await isolateInference.start();
  }

  Future<ModelOutput> _inference(InferenceModel inferenceModel) async {
    ReceivePort responsePort = ReceivePort();
    isolateInference.sendPort
        .send(inferenceModel..responsePort = responsePort.sendPort);
    // get inference result.
    var results = await responsePort.first;
    return results;
  }

  Future<ModelOutput> inference(List<List<double>> tes) async {
    var isolateModel = InferenceModel(
        tes, interpreter.address, inputTensor.shape, outputTensor.shape);
    return _inference(isolateModel);
  }

  Future<void> close() async {
    isolateInference.close();
  }
}
