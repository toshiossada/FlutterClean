import 'package:dartz/dartz.dart';
import 'package:ddd_example/app/modules/login/domain/entities/response/result_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/helpers/utils.dart';
import '../../../domain/entities/request/authenticate.dart';
import '../../../domain/usecases/interfaces/authenticate_by_login_interface.dart';
import 'states/login_state.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final IAuthenticateByLogin _authenticateByLogin;
  final formKey = GlobalKey<FormState>();

  _LoginControllerBase(this._authenticateByLogin);

  Future<void> loginPressed() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await authenticate();

      if (loginState is LoginError) {
        LoginError stateError = loginState;

        Utils.showSnackBar(failure: stateError.error);
      } else if (loginState is LoginSuccess) {
        Utils.showSnackBar(
            msg: "Login Realizado com sucesso", bgColor: Colors.blueAccent);
      }
    }
  }

  @observable
  String login = '';
  @observable
  String password = '';
  @observable
  LoginState loginState = LoginStart();
  @observable
  bool rememberMe = false;

  @computed
  Authenticate get auth =>
      Authenticate(login: login, senha: password, rememberMe: rememberMe);

  @action
  void setLogin(String v) => login = v;
  @action
  void setPassword(String v) => password = v;
  @action
  void switchRememberMe() => rememberMe = !rememberMe;

  @action
  Future<void> authenticate() async {
    loginState = LoginLoad();
    await Future.delayed(Duration(seconds: 1));

    var result = await _authenticateByLogin(auth);

    result.fold((l) => loginState = LoginError(optionOf(l)),
        (r) => loginState = LoginSuccess(r));
  }
}
