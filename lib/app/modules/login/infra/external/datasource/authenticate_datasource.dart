import 'package:ddd_example/app/modules/login/domain/errors/errors.dart';
import 'package:ddd_example/app/modules/login/infra/models/reponse/authenticate_model.dart';
import 'package:ddd_example/app/modules/login/infra/models/request/result_login_model.dart';
import 'package:ddd_example/app/shared/helpers/errors.dart';
import 'package:dio/native_imp.dart';

import '../../data/datasource/authenticate_datasource_interface.dart';

class AuthenticateDatasource implements IAuthenticateDatasource {
  final DioForNative _client;

  AuthenticateDatasource(this._client);
  @override
  Future<ResultLoginModel> authenticate(AuthenticateModel auth) async {
    final response = await _client.post("/user/login", data: auth.toJson());

    if (response.statusCode == 200) {
      if (response.data["success"]) {
        final result = ResultLoginModel.fromMap(response.data['value']);

        return result;
      } else {
        throw DatasourceError(message: response.data['message']);
      }
    } else {
      throw DatasourceError(message: "Falha");
    }
  }
}
