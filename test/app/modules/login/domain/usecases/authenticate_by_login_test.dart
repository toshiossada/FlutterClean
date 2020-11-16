import 'package:dartz/dartz.dart';
import 'package:ddd_example/app/modules/login/domain/entities/request/authenticate.dart';
import 'package:ddd_example/app/modules/login/domain/errors/errors.dart';
import 'package:ddd_example/app/modules/login/domain/repositories/mocks/authenticate_repository_mock.dart';
import 'package:ddd_example/app/modules/login/domain/usecases/authenticate_by_login.dart';
import 'package:ddd_example/app/modules/login/infra/models/request/result_login_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  final repository = AuthenticateRepositoryMock(); 

  AuthenticateByLogin usercase;

  setUp(() {
    usercase = AuthenticateByLogin(repository);
  });

  group('Testes do caso de uso de autenticação', () {
    test('Deve retornar usuario autenticado', () async {
      when(repository.authenticate(any))
          .thenAnswer((_) async => Right(ResultLoginModel()));

      var login =
          Authenticate(login: 'toshiossada', senha: '123456', rememberMe: true);
      final result = await usercase(login);

      expect(result, isA<Right>());
      expect(result | null, isA<ResultLoginModel>());
      verify(repository.authenticate(any)).called(1);
    });

    test('Deve retornar um erro caso o login seja vazio', () async {
      when(repository.authenticate(any))
          .thenAnswer((_) async => Right(ResultLoginModel()));

      var result = await usercase(null);

      expect(result.isLeft(), true);
      expect(result.fold(id, id), isA<InvalidLoginError>());

      var login = Authenticate(login: '', senha: '123', rememberMe: false);
      result = await usercase(login);

      expect(result.isLeft(), true);
      expect(result.fold(id, id), isA<InvalidLoginError>());
      verifyNever(repository.authenticate(any));

      login = Authenticate(login: 'toshiossada', senha: '', rememberMe: false);
      result = await usercase(login);

      expect(result.isLeft(), true);
      expect(result.fold(id, id), isA<InvalidLoginError>());
      verifyNever(repository.authenticate(any));
    });
  });
}
