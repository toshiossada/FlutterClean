import 'package:dartz/dartz.dart';
import 'package:ddd_example/app/modules/login/domain/entities/response/result_login.dart';
import 'package:ddd_example/app/shared/helpers/errors.dart';

abstract class LoginState {}

class LoginSuccess implements LoginState {
  final ResultLogin login;

  LoginSuccess(this.login);
}

class LoginError implements LoginState {
  final Option<Failure> error;

  LoginError(this.error);
}

class LoginStart implements LoginState {}

class LoginLoad implements LoginState {}
