import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'error.dart';
import 'success-error-message.dart';

abstract class CustomCatchWrapper {
  Future<String> handleError({required Object e, StackTrace? stackTrace});
}

@LazySingleton(as: CustomCatchWrapper)
class CustomCatchErrorImpl extends CustomCatchWrapper {
  //todo add more customizations
  @override
  Future<String> handleError({required Object e, StackTrace? stackTrace, bool shouldReturnNull = false}) async {
    String? errorMessage = '';
    if (e is DioError) {
      if (e.response != null) {
        if (e.response!.statusCode != 503) {
          if (e.response?.data is Map && e.response!.data.containsKey('message')) {
            errorMessage = e.response!.data['message'];
          } else {
            errorMessage = errorOrSuccessMessageFromJson(e.response!.data.toString()).message;
          }
        } else {
          errorMessage = ServerException.getErrorMessage(e);
        }
      } else {
        errorMessage = ServerException.getErrorMessage(e);
      }
    } else if (e is NoInternetException) {
      errorMessage = e.toString();
    }
    return errorMessage!;
  }
}
