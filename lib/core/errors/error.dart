import 'package:dio/dio.dart';

class NoInternetException implements Exception {
  @override
  String toString() => 'No Internet';
}

///defines some errors which are thrown
///define your own message for the errors
///just keeping it simple for now
class ServerException implements Exception {
  const ServerException({required this.message});

  final String message;

  static String? getErrorMessage(DioError e) {
    String? message;
    if (e.type == DioErrorType.connectionError) {
      message = "Error occurred while connecting to the internet";
    } else if (e.type == DioErrorType.connectionTimeout) {
      message = "The request timed out";
    } else if (e.type == DioErrorType.receiveTimeout) {
      message = "Receive time out";
    } else if (e.type == DioErrorType.receiveTimeout) {
      message = "Request time out";
    } else if (e.response?.statusCode! == 503) {
      message = "Server was not reachable";
    } else if (e.type == DioErrorType.badResponse) {
      message = "Service not reachable";
    } else if (e.type == DioErrorType.cancel) {
      //here you can just say Request was cancelled or just get it from error
      message = e.error.toString();
    }
    return message!;
  }
}
