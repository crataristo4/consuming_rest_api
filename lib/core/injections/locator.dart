import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

GetIt sl = GetIt.instance;

@InjectableInit(
    initializerName: 'init', // default
    preferRelativeImports: true, // default
    asExtension: false // default
    )
@injectableInit
Future<void> configureDependencies() async => init(sl);
