import 'package:ddd_example/app/modules/login/infra/models/reponse/authenticate_model.dart';
import 'package:ddd_example/app/modules/login/infra/models/request/result_login_model.dart';

abstract class IAuthenticateDatasource {
  Future<ResultLoginModel> authenticate(AuthenticateModel auth);
}
