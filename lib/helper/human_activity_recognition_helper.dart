import 'dart:isolate';

import 'package:ac_recog_app/entities/model_output.dart';
import 'package:ac_recog_app/entities/user.dart';
import 'package:ac_recog_app/helper/isolate_inference.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class HumanActivityRecognitionHelper {
  static const modelPath = 'assets/models/right_16_agustus.tflite';

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
    // Get tensor input shape [1, 70, 11]
    inputTensor = interpreter.getInputTensors().first;
    // Get tensor output shape [1, 9]
    outputTensor = interpreter.getOutputTensors().first;
    // print(inputTensor.toString());
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

  Future<ModelOutput> inference(List<List<double>> inputList, User user) async {
    var isolateModel = InferenceModel(inputList, interpreter.address,
        inputTensor.shape, outputTensor.shape, user);
    return _inference(isolateModel);
  }

  Future<void> close() async {
    isolateInference.close();
  }
}
