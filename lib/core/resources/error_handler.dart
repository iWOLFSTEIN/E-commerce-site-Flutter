import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/core/resources/data_state.dart';
import 'package:e_commerce_site/main.dart';
import 'package:retrofit/retrofit.dart';

class ErrorHandler {
  static Future<DataState<T>> onNetworkRequest<T>(
      {required Future<HttpResponse> Function() fetch}) async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (!(connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi)) {
        const error = ViewConstants.noInternet;
        const type = DioExceptionType.connectionError;
        showErrorInConsole(error: error, type: type);
        return DataFailed(DioException(
            requestOptions: RequestOptions(),
            message: ViewConstants.cantConnectToInternet,
            type: DioExceptionType.connectionError,
            error: ViewConstants.noInternet));
      }

      final httpResponse = await fetch();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess<T>(httpResponse.data);
      } else {
        final error = httpResponse.response.statusMessage;
        const type = DioExceptionType.cancel;
        final response = httpResponse.response;
        showErrorInConsole(error: error, type: type, response: response);
        return DataFailed<T>(DioException(
            error: error,
            message: error,
            response: response,
            type: type,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      showErrorInConsole(
        error: e.error,
        type: e.type,
        stackTrace: e.stackTrace,
      );
      return DataFailed<T>(e);
    } catch (e, s) {
      const type = DioExceptionType.badResponse;
      showErrorInConsole(error: e, type: type, stackTrace: s);
      return DataFailed<T>(DioException(
          error: e.toString(),
          message: ViewConstants.anErrorOccured,
          type: type,
          requestOptions: RequestOptions()));
    }
  }

  static void showErrorInConsole({error, type, stackTrace, response}) {
    logger.e({
      'error': error,
      'type': type,
      'response': response,
      'stackTrace': stackTrace,
    });
  }
}
