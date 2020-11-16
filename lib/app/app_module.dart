import 'package:ddd_example/app/shared/helpers/custom_dio/custom_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:ddd_example/app/app_widget.dart';
import 'shared/components/password_text_form_field/password_text_form_field_controller.dart';
import 'shared/helpers/config.dart' as config;

import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $PasswordTextFormFieldController,
        Bind((i) => CustomDio(i<BaseOptions>())),
        Bind(
          (i) => BaseOptions(
            baseUrl: config.baseURL,
            connectTimeout: 5000,
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
