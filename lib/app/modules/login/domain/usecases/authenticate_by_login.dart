import 'package:dartz/dartz.dart';
import 'package:ddd_example/app/modules/login/domain/entities/request/authenticate.dart';
import 'package:ddd_example/app/modules/login/domain/entities/response/result_login.dart';
import 'package:ddd_example/app/modules/login/domain/errors/errors.dart';
import 'package:ddd_example/app/modules/login/domain/repositories/authenticate_repository_interface.dart';
import 'package:ddd_example/app/modules/login/infra/models/reponse/authenticate_model.dart';

import 'interfaces/authenticate_by_login_interface.dart';

class AuthenticateByLogin implements IAuthenticateByLogin {
  final IAuthenticateRepository _repository;

  AuthenticateByLogin(this._repository);
  @override
  Future<Either<FailureLogin, ResultLogin>> call(
      Authenticate authenticate) async {
    if (authenticate == null || !authenticate.isValid) {
      return Left(InvalidLoginError(
          message: 'Login ou senha esta com preenchimento inválido'));
    }

    var model = AuthenticateModel(
      login: authenticate.login,
      senha: authenticate.senha,
    );
    var result = await _repository.authenticate(model);

    return result;
  }
}
