class AppFailure implements Exception {
  final String message;

  AppFailure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends AppFailure {
  ServerFailure(String message) : super(message);
}

class CacheFailure extends AppFailure {
  CacheFailure(String message) : super(message);
}

class NetworkFailure extends AppFailure {
  NetworkFailure(String message) : super(message);
}

class AuthenticationFailure extends AppFailure {
  AuthenticationFailure(String message) : super(message);
}

class ValidationFailure extends AppFailure {
  ValidationFailure(String message) : super(message);
}

class NotFoundFailure extends AppFailure {
  NotFoundFailure(String message) : super(message);
}

class UnknownFailure extends AppFailure {
  UnknownFailure(String message) : super(message);
}
