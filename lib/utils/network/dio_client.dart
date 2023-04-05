import 'package:dio/dio.dart';

class DioClient {
  static DioClient? _instance;

  static DioClient get instance => _instance == null ? _instance = DioClient._() : _instance!;

  static BaseOptions initDio() {
    return BaseOptions(
        baseUrl: 'http://api.aviationstack.com/v1',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 45),
        sendTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json;charset=UTF-8', 'Charset': 'utf-8'});
  }

  DioClient._();

  Dio _dio(BaseOptions? baseOptions) {
    final dio = Dio();
    return Dio(baseOptions)
      ..interceptors.addAll([
        //Logging(),
      ]);
    // ..interceptors.add(CookieManager(CookieJar()));
  }

  Dio get getDio => _dio(initDio());
}
