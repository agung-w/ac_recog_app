import 'dart:convert';

import 'package:ac_recog_app/const/api_const.dart';
import 'package:ac_recog_app/entities/model_input.dart';
import 'package:ac_recog_app/helper/api_result.dart';
import 'package:dio/dio.dart';

class ModelInputRepository {
  late final Dio _dio;
  ModelInputRepository({Dio? dio}) {
    _dio = dio ?? Dio(BaseOptions(connectTimeout: const Duration(seconds: 5)));
  }
  Future<ApiResult<String>> storeData({required List<ModelInput> data}) async {
    var json = jsonEncode(data.map((e) => e.toJson()).toList());
    try {
      Response result =
          await _dio.post("$baseAPIUrl/model-input/insert", data: json);
      if (result.statusCode != 200) {
        throw (DioException(
            response: result, requestOptions: result.requestOptions));
      }
      return const ApiResult.success("Data sync success");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return const ApiResult.failed("Can't connect to server");
      }
      return const ApiResult.failed("Unable to sync data now");
    }
  }
}
