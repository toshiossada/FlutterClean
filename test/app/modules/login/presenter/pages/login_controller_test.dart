import 'package:dartz/dartz.dart';
import 'package:ddd_example/app/modules/login/domain/entities/request/authenticate.dart';
import 'package:ddd_example/app/modules/login/domain/entities/response/result_login.dart';
import 'package:ddd_example/app/modules/login/domain/usecases/interfaces/mock/authenticate_by_login_interface.dart';
import 'package:ddd_example/app/modules/login/presenter/pages/login/login_controller.dart';
import 'package:ddd_example/app/modules/login/presenter/pages/login/states/login_state.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

void main() {
  LoginController controller;
  final authenticateByLoginMock = AuthenticateByLoginMock();
  setUp(() {
    controller = LoginController(authenticateByLoginMock);
  });

  group('Teste de integração de todo da controller do login', () {
    test("Deve trazer usuario autenticado", () async {
      when(authenticateByLoginMock(any))
          .thenAnswer((_) async => Right(ResultLogin()));
      var login = Authenticate(login: 'toshiossada', senha: '123456');
      controller.setLogin(login.login);
      controller.setPassword(login.senha);

      await controller.authenticate();
      expect(controller.loginState, isA<LoginSuccess>());
    });
  });
}
