// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_text_form_field_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PasswordTextFormFieldController = BindInject(
  (i) => PasswordTextFormFieldController(),
  singleton: false,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PasswordTextFormFieldController
    on _PasswordTextFormFieldControllerBase, Store {
  final _$visibleAtom =
      Atom(name: '_PasswordTextFormFieldControllerBase.visible');

  @override
  bool get visible {
    _$visibleAtom.reportRead();
    return super.visible;
  }

  @override
  set visible(bool value) {
    _$visibleAtom.reportWrite(value, super.visible, () {
      super.visible = value;
    });
  }

  final _$_PasswordTextFormFieldControllerBaseActionController =
      ActionController(name: '_PasswordTextFormFieldControllerBase');

  @override
  void switchVisible() {
    final _$actionInfo =
        _$_PasswordTextFormFieldControllerBaseActionController.startAction(
            name: '_PasswordTextFormFieldControllerBase.switchVisible');
    try {
      return super.switchVisible();
    } finally {
      _$_PasswordTextFormFieldControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
visible: ${visible}
    ''';
  }
}
