import 'dart:convert';

import '../../../domain/entities/request/authenticate.dart';

class AuthenticateModel extends Authenticate {
  final String login;
  final String senha;

  AuthenticateModel({this.login, this.senha});

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'senha': senha,
    };
  }

  factory AuthenticateModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthenticateModel(
      login: map['login'],
      senha: map['senha'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticateModel.fromJson(String source) =>
      AuthenticateModel.fromMap(json.decode(source));
}
