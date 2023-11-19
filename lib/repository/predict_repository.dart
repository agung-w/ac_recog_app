import 'package:ac_recog_app/const/api_const.dart';
import 'package:ac_recog_app/entities/model_output.dart';
import 'package:ac_recog_app/entities/user.dart';
import 'package:ac_recog_app/helper/api_result.dart';
import 'package:dio/dio.dart';

class PredictRepository {
  late final Dio _dio;
  PredictRepository({Dio? dio}) {
    _dio = dio ?? Dio(BaseOptions(connectTimeout: const Duration(seconds: 5)));
  }
  Future<ApiResult<ModelOutput>> getPrediction(
      {required User user, required List<List<List<double>>> input}) async {
    var json = {
      "name": user.name,
      "hand": user.hand,
      "prediction_input": input
    };
    try {
      Response result = await _dio.post("$predictUrl/predict", data: json);
      if (result.statusCode != 200) {
        throw (DioException(
            response: result, requestOptions: result.requestOptions));
      }
      return ApiResult.success(ModelOutput.fromJson(result.data));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return const ApiResult.failed("Can't connect to server");
      }
      return const ApiResult.failed("Unable to sync data now");
    }
  }
}
