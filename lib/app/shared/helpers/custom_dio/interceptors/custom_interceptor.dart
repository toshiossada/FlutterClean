import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

//import '../../../stores/user_store.dart';
import '../../errors.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    // var userService = Modular.get<UserStore>();
    var token = '';
    //userService.user?.token ?? '';
    if (token.isNotEmpty) {
      var headerAuth = _genToken(token);
      options.headers['Authorization'] = headerAuth;
    }
    //Imprimindo informações do request para debug
    if (kDebugMode) {
      debugPrint(json.encode("BaseURL: ${options.baseUrl}"));
      debugPrint(json.encode("Endpoint: ${options.path}"));
      if (options.headers['Authorization'] != null) {
        debugPrint("Authorization: ${options.headers['Authorization']}");
      }
      if (options.data != null) {
        debugPrint("Payload ${json.encode(options.data)}");
      }
    }

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    if (err.response?.statusCode == 400) {
      var msg = err.response.data["notifications"] == null
          ? err.error
          : err.response.data["notifications"][0]["message"];

      return DioFailure(message: msg, statusCode: err.response.statusCode);
    }
    return DioFailure(
        message:
            err.response.data ?? 'Ocorreu um erro na requisição com o servidor',
        statusCode: err.response?.statusCode ?? 500);
  }

  String _genToken(String token) {
    return 'Bearer $token';
  }
}
