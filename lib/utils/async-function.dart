import 'package:consuming_rest_api/core/errors/error.dart';
import 'package:injectable/injectable.dart';

import 'network/networkInfo.dart';

///Use this to handle network calls in all data source
abstract class AsyncFunctionWrapper {
  Future handleAsyncNetworkCall(Function() asyncMethod);
}

@LazySingleton(as: AsyncFunctionWrapper)
class AsyncFunctionImpl extends AsyncFunctionWrapper {
  NetworkInfo networkInfo;

  AsyncFunctionImpl(this.networkInfo);

  @override
  Future handleAsyncNetworkCall(Function() asyncMethod) async {
    if (await networkInfo.isConnected) {
      return await asyncMethod();
    } else {
      throw NoInternetException();
    }
  }
}
