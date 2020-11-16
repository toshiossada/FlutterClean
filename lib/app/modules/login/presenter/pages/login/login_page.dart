import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/login_form/login_form_widget.dart';
import 'login_controller.dart';
import 'states/login_state.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 80),
                      ),
                      Observer(
                        builder: (_) => Form(
                          key: controller.formKey,
                          child: LoginFormWidget(
                            rememberme: controller.rememberMe,
                            switchRememberMe: controller.switchRememberMe,
                            onChangeLogin: controller.setLogin,
                            onChangePassword: controller.setPassword,
                            loading: controller.loginState is LoginLoad,
                            loginPressed: controller.loginPressed,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
