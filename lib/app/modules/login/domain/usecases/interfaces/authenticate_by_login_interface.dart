import 'package:dartz/dartz.dart';
import 'package:ddd_example/app/modules/login/domain/entities/request/authenticate.dart';
import 'package:ddd_example/app/modules/login/domain/entities/response/result_login.dart';
import 'package:ddd_example/app/modules/login/domain/errors/errors.dart';

abstract class IAuthenticateByLogin {
  Future<Either<FailureLogin, ResultLogin>> call(Authenticate authenticate);
}
