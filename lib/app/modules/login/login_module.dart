import 'package:dio/native_imp.dart';

import 'domain/repositories/authenticate_repository_interface.dart';
import 'domain/usecases/authenticate_by_login.dart';
import 'domain/usecases/interfaces/authenticate_by_login_interface.dart';
import 'infra/data/repositories/authenticate_repository.dart';
import 'infra/external/datasource/authenticate_datasource.dart';
import 'presenter/pages/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/login/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i<IAuthenticateByLogin>())), 
        Bind((i) => AuthenticateDatasource(i<DioForNative>())),
        Bind((i) => $AuthenticateRepository),
        Bind((i) => AuthenticateByLogin(i<IAuthenticateRepository>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
