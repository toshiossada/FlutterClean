
class Authenticate {
  final String login;
  final String senha;
  final bool rememberMe;

  Authenticate({
    this.login,
    this.senha,
    this.rememberMe,
  });

  bool get isValid => login.isNotEmpty && senha.isNotEmpty;
}
