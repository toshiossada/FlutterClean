import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../rounded_text_field/rounded_text_field_widget.dart';
import 'password_text_form_field_controller.dart';

// ignore: must_be_immutable
class PasswordTextFormFieldWidget extends StatefulWidget {
  final Function(String) onChanged;
  final String label;
  final Function validator;

  PasswordTextFormFieldWidget({
    Key key,
    this.onChanged,
    this.label,
    this.validator,
  }) : super(key: key);

  @override
  _PasswordTextFormFieldWidgetState createState() =>
      _PasswordTextFormFieldWidgetState();
}

class _PasswordTextFormFieldWidgetState extends ModularState<
    PasswordTextFormFieldWidget, PasswordTextFormFieldController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return RoundedTextFieldWidget(
          labelText: widget.label,
          fontColor: Colors.black.withOpacity(0.8),
          backgroundColor: Colors.transparent,
          obscureText: !controller.visible,
          onChanged: widget.onChanged,
          validator: widget.validator,
          suffixIcon: IconButton(
            onPressed: controller.switchVisible,
            icon: Icon(
              controller.visible
                  ? FontAwesomeIcons.eyeSlash
                  : FontAwesomeIcons.eye,
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
