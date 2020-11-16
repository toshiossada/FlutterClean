import 'dart:convert';

import 'package:ddd_example/app/modules/login/infra/external/datasource/authenticate_datasource.dart';
import 'package:ddd_example/app/modules/login/infra/models/reponse/authenticate_model.dart';
import 'package:ddd_example/app/shared/helpers/errors.dart';
import 'package:ddd_example/app/shared/helpers/responses/authentication_response.dart'
    as mock_response;
import 'package:ddd_example/app/shared/helpers/custom_dio/mock/custom_dio_mock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

void main() {
  AuthenticateDatasource datasource;
  final client = CustomDioMock();

  setUp(() {
    datasource = AuthenticateDatasource(client);
  });

  group('Testes do DataSource para login', () {
    test('Deve retornar usuario autenticado', () async {
      var login = AuthenticateModel();

      when(client.post(any, data: login.toJson())).thenAnswer((_) async =>
          Response(
              data: jsonDecode(mock_response.loginResponseSuccess),
              statusCode: 200));
      final result = datasource.authenticate(login);

      expect(result, completes);
    });

    test(
        'Deve retornar um DataSourceError quando api retorna que não obteve sucesso',
        () async {
      var login = AuthenticateModel();

      when(client.post(any, data: login.toJson())).thenAnswer((_) async =>
          Response(
              data: jsonDecode(mock_response.loginResponseFailure),
              statusCode: 200));
      final result = datasource.authenticate(login);

      expect(result, throwsA(isA<DatasourceError>()));
    });

    test('Deve retornar um DataSourceError se o código não for 200', () async {
      var login = AuthenticateModel();

      when(client.post(any, data: login.toJson()))
          .thenAnswer((_) async => Response(data: null, statusCode: 404));
      final result = datasource.authenticate(login);

      expect(result, throwsA(isA<DatasourceError>()));
    });
  });
}
