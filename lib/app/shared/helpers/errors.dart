abstract class Failure implements Exception {
  String get message;
}

class FirebaseFailure extends Failure {
  @override
  final String message;
  final String code;
  FirebaseFailure({
    this.message,
    this.code,
  });
}

class DefaultFailure extends Failure {
  @override
  final String message;
  DefaultFailure({
    this.message,
  });
}

class DioFailure extends Failure {
  @override
  final String message;
  final int statusCode;
  DioFailure({
    this.message,
    this.statusCode,
  });
}

class DatasourceError extends Failure {
  @override
  final String message;
  DatasourceError({
    this.message,
  });
}
