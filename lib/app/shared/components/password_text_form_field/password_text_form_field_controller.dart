import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'password_text_form_field_controller.g.dart';

@Injectable(singleton: false)
class PasswordTextFormFieldController = _PasswordTextFormFieldControllerBase
    with _$PasswordTextFormFieldController;

abstract class _PasswordTextFormFieldControllerBase with Store {
  @observable
  bool visible = false;

  @action
  void switchVisible() => visible = !visible;
}
