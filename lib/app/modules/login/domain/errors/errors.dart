import 'package:ddd_example/app/shared/helpers/errors.dart';

abstract class FailureLogin implements Failure {}

class InvalidLoginError implements FailureLogin {
  @override
  final String message;
  InvalidLoginError({
    this.message,
  });
}

class FailureRecoveryPassword implements FailureLogin {
  @override
  final String message;
  FailureRecoveryPassword({
    this.message,
  });
}
