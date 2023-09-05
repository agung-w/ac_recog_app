import 'dart:convert';

import 'package:ac_recog_app/const/api_const.dart';
import 'package:ac_recog_app/entities/model_output.dart';
import 'package:ac_recog_app/entities/motion_summary.dart';
import 'package:ac_recog_app/helper/api_result.dart';
import 'package:dio/dio.dart';

class ModelOutputRepository {
  late final Dio _dio;
  ModelOutputRepository({Dio? dio}) {
    _dio = dio ?? Dio(BaseOptions(connectTimeout: const Duration(seconds: 5)));
  }
  Future<ApiResult<String>> storeData({required List<ModelOutput> data}) async {
    var json = jsonEncode(data.map((e) => e.toJson()).toList());
    try {
      Response result =
          await _dio.post("$baseAPIUrl/model-output/insert", data: json);
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

  Future<ApiResult<List<MotionSummary>>> getTrainingSummary(
      {required String name,
      required int startTime,
      required int endTime}) async {
    var data = {"name": name, "start_time": startTime, "end_time": endTime};
    try {
      Response result = await _dio.get("$baseAPIUrl/training-summary",
          data: jsonEncode(data));
      if (result.statusCode != 200) {
        throw (DioException(
            response: result, requestOptions: result.requestOptions));
      }
      List<MotionSummary> summaries =
          (result.data as List).map((e) => MotionSummary.fromJson(e)).toList();
      return ApiResult.success(summaries);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return const ApiResult.failed("Can't connect to server");
      } else {
        return const ApiResult.failed("Unable to get summary data");
      }
    }
  }
}
