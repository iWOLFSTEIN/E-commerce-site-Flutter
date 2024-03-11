import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce_site/core/resources/data_state.dart';
import 'package:retrofit/retrofit.dart';

class ApiErrorHandler {
  static Future onNetworkRequest(
      {required Future<HttpResponse> Function() fetch}) async {
    try {
      final httpResponse = await fetch();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      DataFailed(e);
    }
  }
}
