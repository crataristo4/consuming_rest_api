import 'package:consuming_rest_api/core/data/services/api_service.dart';
import 'package:consuming_rest_api/core/injections/injections.dart';
import 'package:consuming_rest_api/core/models/airlines.dart';
import 'package:consuming_rest_api/utils/async-function.dart';
import 'package:consuming_rest_api/utils/enums.dart';
import 'package:injectable/injectable.dart';

abstract class AviationDataSource {
  Future<List<Airline>?> getAirlines();
}

@LazySingleton(as: AviationDataSource) //injection
class AviationDataSourceImpl extends AviationDataSource {
  final ApiService _apiService = ApiService.instance;
  final AsyncFunctionWrapper _asyncFunction = sl<AsyncFunctionWrapper>();

  @override
  Future<List<Airline>?> getAirlines() async {
    return await _asyncFunction.handleAsyncNetworkCall(() async {
      final results = await _apiService.callService(
          requestType: RequestType.get, endPoint: '/airlines', queryParams: {"access_key": "8694e62ad7a4b0abf21f834e87b5b6b1"});
      return (results.data as List).map((data) => Airline.fromJson(data)).toList();
    });
  }
}
