import 'dart:convert';

class AuthenticationModel {
  final int idUsuario;
  final String nomeUsuario;
  final String loginUsuario;
  final String emailUsuario;
  final String cnpjCpf;
  final int statusLogin;
  final int idContrato;
  final int qtdeNcms;

  AuthenticationModel({
    this.idUsuario,
    this.nomeUsuario,
    this.loginUsuario,
    this.emailUsuario,
    this.cnpjCpf,
    this.statusLogin,
    this.idContrato,
    this.qtdeNcms,
  });

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'nomeUsuario': nomeUsuario,
      'loginUsuario': loginUsuario,
      'emailUsuario': emailUsuario,
      'cnpjCpf': cnpjCpf,
      'statusLogin': statusLogin,
      'idContrato': idContrato,
      'qtdeNcms': qtdeNcms,
    };
  }

  factory AuthenticationModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthenticationModel(
      idUsuario: map['idUsuario'],
      nomeUsuario: map['nomeUsuario'],
      loginUsuario: map['loginUsuario'],
      emailUsuario: map['emailUsuario'],
      cnpjCpf: map['cnpjCpf'],
      statusLogin: map['statusLogin'],
      idContrato: map['idContrato'],
      qtdeNcms: map['qtdeNcms'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationModel.fromJson(String source) =>
      AuthenticationModel.fromMap(json.decode(source));
}
