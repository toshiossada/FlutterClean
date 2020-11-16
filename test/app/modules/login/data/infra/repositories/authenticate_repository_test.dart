import 'package:dartz/dartz.dart';
import 'package:ddd_example/app/modules/login/domain/errors/errors.dart';
import 'package:ddd_example/app/modules/login/infra/data/datasource/mock/authenticate_datasource_mock.dart';
import 'package:ddd_example/app/modules/login/infra/data/repositories/authenticate_repository.dart';
import 'package:ddd_example/app/modules/login/infra/models/reponse/authenticate_model.dart';
import 'package:ddd_example/app/modules/login/infra/models/request/result_login_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

void main() {
  AuthenticateRepository repository;
  final datasource = AuthenticateDatasourceMock();

  setUp(() {
    repository = AuthenticateRepository(datasource);
  });

  group('teste de autenticação do usuario', () {
    test('Deve retornar usuario autenticado', () async {
      var login = AuthenticateModel();

      when(datasource.authenticate(any))
          .thenAnswer((_) async => ResultLoginModel());

      final result = await repository.authenticate(login);

      expect(result | null, isA<ResultLoginModel>());
    });

    test('Deve um erro se datasource falhar', () async {
      var login = AuthenticateModel();

      when(datasource.authenticate(any)).thenThrow(Exception());

      final result = await repository.authenticate(login);

      expect(result.fold(id, id), isA<InvalidLoginError>());
    });
  });
}
