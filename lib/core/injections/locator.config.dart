// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;

import '../../utils/async-function.dart' as _i10;
import '../../utils/network/networkInfo.dart' as _i9;
import '../data/data-source/aviation_datasource.dart' as _i3;
import '../data/repository/aviation_repository.dart' as _i4;
import '../data/services/aviation_service.dart' as _i5;
import '../errors/custom-catch-error.dart' as _i7;
import '../view_model/aviation_view_model.dart' as _i6;
import 'register_module.dart' as _i11;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AviationDataSource>(() => _i3.AviationDataSourceImpl());
  gh.lazySingleton<_i4.AviationRepo>(
      () => _i4.AviationRepoImpl(gh<_i3.AviationDataSource>()));
  gh.lazySingleton<_i5.AviationService>(
      () => _i5.AviationServiceImpl(gh<_i4.AviationRepo>()));
  gh.lazySingleton<_i6.AviationViewModel>(() => _i6.AviationViewModel());
  gh.lazySingleton<_i7.CustomCatchWrapper>(() => _i7.CustomCatchErrorImpl());
  gh.factory<_i8.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i9.NetworkInfo>(
      () => _i9.NetworkInfoImpl(gh<_i8.InternetConnectionChecker>()));
  gh.lazySingleton<_i10.AsyncFunctionWrapper>(
      () => _i10.AsyncFunctionImpl(gh<_i9.NetworkInfo>()));
  return getIt;
}

class _$RegisterModule extends _i11.RegisterModule {}
