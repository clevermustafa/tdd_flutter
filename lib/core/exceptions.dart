class ServerException implements Exception {
  final String exceptionMessage;

  ServerException(this.exceptionMessage);
}

class UnknownException implements Exception {
  final String exceptionMessage;

  UnknownException(this.exceptionMessage);
}
