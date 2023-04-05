import 'package:consuming_rest_api/core/data/data-source/aviation_datasource.dart';
import 'package:consuming_rest_api/core/errors/custom-catch-error.dart';
import 'package:consuming_rest_api/core/injections/injections.dart';
import 'package:consuming_rest_api/core/models/airlines.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class AviationRepo {
  Future<Either<String, List<Airline>?>> getAirlines();
}

@LazySingleton(as: AviationRepo)
class AviationRepoImpl extends AviationRepo {
  AviationDataSource aviationDataSource;
  AviationRepoImpl(this.aviationDataSource);

  ///refer to part 2 it was created there
  final CustomCatchWrapper _customTryCatchWrapper = sl<CustomCatchWrapper>();

  @override
  Future<Either<String, List<Airline>?>> getAirlines() async {
    try {
      final results = await aviationDataSource.getAirlines();
      return Right(results);
    } catch (e, stackTrace) {
      return Left(await _customTryCatchWrapper.handleError(e: e, stackTrace: stackTrace));
    }
  }
}
