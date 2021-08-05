import 'dart:async';

import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  FutureOr<dynamic> onError(DioError dioError, interceptor) {
    if (dioError.message.contains("ERROR_001")) {
      // this will push a new route and remove all the routes that were present
    }

    return dioError;
  }
}
