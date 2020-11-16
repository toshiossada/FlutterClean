import 'dart:convert';

import '../../../domain/entities/response/result_login.dart';

class ResultLoginModel extends ResultLogin {
  final int idUsuario;
  final String nomeUsuario;
  final String loginUsuario;
  final String emailUsuario;
  final String cnpjCpf;
  final int statusLogin;
  final int idContrato;
  final int qtdeNcms;

  ResultLoginModel({
    this.idUsuario,
    this.nomeUsuario,
    this.loginUsuario,
    this.emailUsuario,
    this.cnpjCpf,
    this.statusLogin,
    this.idContrato,
    this.qtdeNcms,
  }) : super(
          idUsuario: idUsuario,
          nomeUsuario: nomeUsuario,
          loginUsuario: loginUsuario,
          emailUsuario: emailUsuario,
        );

  Map<String, dynamic> toMap() {
    return {
      'id_usuario': idUsuario,
      'nome_usuario': nomeUsuario,
      'login_usuario': loginUsuario,
      'email_usuario': emailUsuario,
      'cnpJ_CPF': cnpjCpf,
      'status_login': statusLogin,
      'id_contrato': idContrato,
      'qtde_ncms': qtdeNcms,
    };
  }

  factory ResultLoginModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultLoginModel(
      idUsuario: map['id_usuario'],
      nomeUsuario: map['nome_usuario'],
      loginUsuario: map['login_usuario'],
      emailUsuario: map['email_usuario'],
      cnpjCpf: map['cnpJ_CPF'],
      statusLogin: map['status_login'],
      idContrato: map['id_contrato'],
      qtdeNcms: map['qtde_ncms'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultLoginModel.fromJson(String source) =>
      ResultLoginModel.fromMap(json.decode(source));
}
