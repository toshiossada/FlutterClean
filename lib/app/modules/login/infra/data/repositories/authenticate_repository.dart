import 'package:dartz/dartz.dart';
import 'package:ddd_example/app/modules/login/infra/models/reponse/authenticate_model.dart';
import 'package:ddd_example/app/modules/login/infra/models/request/result_login_model.dart';
import 'package:ddd_example/app/shared/helpers/errors.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_annotations.dart';

import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/authenticate_repository_interface.dart';
import '../datasource/authenticate_datasource_interface.dart';

part 'authenticate_repository.g.dart';

@Injectable()
class AuthenticateRepository implements IAuthenticateRepository {
  final IAuthenticateDatasource _authenticateDatasource;

  AuthenticateRepository(this._authenticateDatasource);

  @override
  Future<Either<FailureLogin, ResultLoginModel>> authenticate(
      AuthenticateModel authenticate) async {
    try {
      final result = await _authenticateDatasource.authenticate(authenticate);

      return Right(result);
    } on Failure catch (err) {
      return Left(err);
    } on DioError catch (e) {
      if (e.error is DioFailure)
        return Left(
            InvalidLoginError(message: (e.error as DioFailure).message));
      else
        return Left(
            InvalidLoginError(message: 'Falha ao faer requisição ao servidor'));
    } on Exception catch (e) {
      return Left(InvalidLoginError(message: e.toString()));
    }
  }
}
