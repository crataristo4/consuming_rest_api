import 'package:consuming_rest_api/core/models/aviation_response.dart';
import 'package:consuming_rest_api/utils/enums.dart';
import 'package:consuming_rest_api/utils/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

var cancelRequestToken = CancelToken();
var logger = Logger(printer: PrettyPrinter(lineLength: 500));

class ApiService<T> {
  static ApiService? _instance;

  static ApiService get instance {
    return _instance == null ? _instance = ApiService._() : _instance!;
  }

  final Dio _dioClient = DioClient.instance.getDio;

  ApiService._();

  ///[payload] ==> payload , [endPoint] ==> path or uri
  ///[requestType] ==> This is the enum created earlier
  ///[payload] ==> data/object that will be sent to
  ///[options] ==> this will help us add extra headers should the API
  ///need it when making a request.
  Future callService(
      {required RequestType requestType,
      required String endPoint,
      T? payload,
      Map<String, dynamic>? queryParams,
      Options? options}) async {
    late Response response;

    switch (requestType) {
      case RequestType.get:
        response =
            await _dioClient.get(endPoint, queryParameters: queryParams, options: options, cancelToken: cancelRequestToken);
        break;
      case RequestType.post:
        response = await _dioClient.post(endPoint,
            data: payload, queryParameters: queryParams, options: options, cancelToken: cancelRequestToken);
        break;
      case RequestType.put:
        response = await _dioClient.put(endPoint,
            data: payload, queryParameters: queryParams, options: options, cancelToken: cancelRequestToken);
        break;
      case RequestType.patch:
        response = await _dioClient.patch(endPoint,
            data: payload, queryParameters: queryParams, options: options, cancelToken: cancelRequestToken);
        break;
      case RequestType.delete:
        response = await _dioClient.delete(endPoint,
            data: payload, queryParameters: queryParams, options: options, cancelToken: cancelRequestToken);
        break;
    }
    return aviationResponseFromJson(response.toString());
  }
}
