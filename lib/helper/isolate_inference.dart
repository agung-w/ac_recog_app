import 'dart:isolate';
import 'package:ac_recog_app/const/model_const.dart';
import 'package:ac_recog_app/entities/model_output.dart';
import 'package:ac_recog_app/entities/user.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class IsolateInference {
  static const String _debugName = "TFLITE_INFERENCE";
  final ReceivePort _receivePort = ReceivePort();
  late Isolate _isolate;
  late SendPort _sendPort;

  SendPort get sendPort => _sendPort;

  Future<void> start() async {
    _isolate = await Isolate.spawn<SendPort>(entryPoint, _receivePort.sendPort,
        debugName: _debugName);
    _sendPort = await _receivePort.first;
  }

  Future<void> close() async {
    _isolate.kill();
    _receivePort.close();
  }

  static void entryPoint(SendPort sendPort) async {
    final port = ReceivePort();
    sendPort.send(port.sendPort);

    await for (final InferenceModel isolateModel in port) {
      // Set tensor input shape [1, 28, 11]
      final input = [isolateModel.sensorData];
      // Set tensor output shape [1, 9]
      final output = [List<double>.filled(isolateModel.outputShape[1], 0)];
      // // Run inference
      Interpreter interpreter =
          Interpreter.fromAddress(isolateModel.interpreterAddress);
      interpreter.run(input, output);
      // Get first output tensor
      final result = output.first;
      double maxScore =
          result.reduce((curr, next) => curr > next ? curr : next);
      ModelOutput modelOutput = ModelOutput(
          timestamp: DateTime.now().millisecondsSinceEpoch,
          result: labels[result.indexOf(maxScore)],
          probability: maxScore,
          name: isolateModel.user.name,
          hand: isolateModel.user.hand);
      isolateModel.responsePort.send(modelOutput);
    }
  }
}

class InferenceModel {
  List<List<double>> sensorData;
  int interpreterAddress;
  List<int> inputShape;
  List<int> outputShape;
  late SendPort responsePort;
  User user;

  InferenceModel(this.sensorData, this.interpreterAddress, this.inputShape,
      this.outputShape, this.user);
}
