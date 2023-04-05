import 'package:consuming_rest_api/core/data/repository/aviation_repository.dart';
import 'package:consuming_rest_api/core/models/airlines.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class AviationService {
  Future<Either<String, List<Airline>?>> getAirlines();
}

@LazySingleton(as: AviationService)
class AviationServiceImpl extends AviationService {
  AviationRepo aviationRepo;

  AviationServiceImpl(this.aviationRepo);

  @override
  Future<Either<String, List<Airline>?>> getAirlines() async {
    return await aviationRepo.getAirlines();
  }
}
