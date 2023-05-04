class InvalidCredentialsException implements Exception {
  InvalidCredentialsException({this.message = 'معلومات تسجيل دخول غير صحيحة'});
  final String message;
}

class NoResultReturnedException implements Exception {}

class NullObjectsOnSuccessLoginException implements Exception {}
