// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<Authenticate> _$authComputed;

  @override
  Authenticate get auth =>
      (_$authComputed ??= Computed<Authenticate>(() => super.auth,
              name: '_LoginControllerBase.auth'))
          .value;

  final _$loginAtom = Atom(name: '_LoginControllerBase.login');

  @override
  String get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$loginStateAtom = Atom(name: '_LoginControllerBase.loginState');

  @override
  LoginState get loginState {
    _$loginStateAtom.reportRead();
    return super.loginState;
  }

  @override
  set loginState(LoginState value) {
    _$loginStateAtom.reportWrite(value, super.loginState, () {
      super.loginState = value;
    });
  }

  final _$rememberMeAtom = Atom(name: '_LoginControllerBase.rememberMe');

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportRead();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.reportWrite(value, super.rememberMe, () {
      super.rememberMe = value;
    });
  }

  final _$authenticateAsyncAction =
      AsyncAction('_LoginControllerBase.authenticate');

  @override
  Future<void> authenticate() {
    return _$authenticateAsyncAction.run(() => super.authenticate());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void setLogin(String v) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setLogin');
    try {
      return super.setLogin(v);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String v) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setPassword');
    try {
      return super.setPassword(v);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchRememberMe() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.switchRememberMe');
    try {
      return super.switchRememberMe();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
login: ${login},
password: ${password},
loginState: ${loginState},
rememberMe: ${rememberMe},
auth: ${auth}
    ''';
  }
}
