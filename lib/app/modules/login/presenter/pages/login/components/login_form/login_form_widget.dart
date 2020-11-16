import 'package:flutter/material.dart';

import '../../../../../../../shared/components/circular_button_widget/circular_button_widget_widget.dart';
import '../../../../../../../shared/components/circular_progress_indicator/circular_progress_indicator_widget.dart';
import '../../../../../../../shared/components/password_text_form_field/password_text_form_field_widget.dart';
import '../../../../../../../shared/components/rounded_text_field/rounded_text_field_widget.dart';

class LoginFormWidget extends StatelessWidget {
  final Function(String) onChangeLogin;
  final Function(String) onChangePassword;
  final Function loginPressed;
  final Function authenticate;
  final Function switchRememberMe;
  final bool loading;
  final bool rememberme;

  const LoginFormWidget(
      {Key key,
      this.onChangeLogin,
      this.onChangePassword,
      this.loginPressed,
      this.authenticate,
      this.loading,
      this.switchRememberMe,
      this.rememberme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Login',
            style: Theme.of(context).textTheme.headline6,
          ),
          RoundedTextFieldWidget(
            labelText: 'Usuário',
            fontColor: Colors.black.withOpacity(0.8),
            backgroundColor: Colors.transparent,
            onChanged: onChangeLogin,
            validator: (value) {
              if (value.isEmpty)
                return 'Usuário Inválido';
              else
                return null;
            },
          ),
          PasswordTextFormFieldWidget(
            onChanged: onChangePassword,
            validator: (value) {
              if (value.isEmpty)
                return 'Senha Inválido';
              else
                return null;
            },
            label: 'Senha',
          ),
          SizedBox(height: 30),
          Container(
            child: loading
                ? CircularProgressIndicatorWidget(
                    color: Colors.black,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircularButtonWidget(
                        backgroundColor: Colors.black,
                        label: "ENTRAR",
                        onTap: loginPressed,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
