import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'interceptors/custom_interceptor.dart';


class CustomDio extends DioForNative {
  CustomDio([BaseOptions options]) : super(options) {
    interceptors.add(CustomInterceptors());
  }
}
