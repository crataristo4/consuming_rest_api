import 'package:consuming_rest_api/core/data/services/aviation_service.dart';
import 'package:consuming_rest_api/core/injections/injections.dart';
import 'package:consuming_rest_api/core/models/airlines.dart';
import 'package:consuming_rest_api/utils/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AviationViewModel extends ChangeNotifier {
  BaseModelState getFlightsState = BaseModelState.initial;

  ///this error message will be helpful if we want to show it on the UI
  ///to make the user know what went wrong then retry
  String? errorMessage = "";

  List<Airline>? _listOfFlights = List.empty(growable: true);
  List<Airline>? get listOfFlights => _listOfFlights;

  final AviationService _aviationService = sl<AviationService>();

  ///get all flights data
  Future<void> getFlights() async {
    getFlightsState = BaseModelState.loading;
    final results = await _aviationService.getAirlines();

    results.fold((errorMessage) {
      ///this is the Left we talked about
      errorMessage = errorMessage;
      getFlightsState = BaseModelState.error;
    }, (data) {
      ///this is the right we talked about
      _listOfFlights = data;
      getFlightsState = BaseModelState.success;
    });

    ///Most important
    notifyListeners();
  }
}
