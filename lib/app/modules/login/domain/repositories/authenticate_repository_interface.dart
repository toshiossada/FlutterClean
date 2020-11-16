import 'package:dartz/dartz.dart';
import 'package:ddd_example/app/modules/login/domain/errors/errors.dart';
import 'package:ddd_example/app/modules/login/infra/models/reponse/authenticate_model.dart';
import 'package:ddd_example/app/modules/login/infra/models/request/result_login_model.dart';

abstract class IAuthenticateRepository {
  Future<Either<FailureLogin, ResultLoginModel>> authenticate(
      AuthenticateModel authenticate);
}
