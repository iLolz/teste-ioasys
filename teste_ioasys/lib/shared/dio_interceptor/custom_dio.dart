import 'package:dio/native_imp.dart';

import 'interceptor_token.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    interceptors.add(InterceptorToken());
  }
}
