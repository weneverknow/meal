abstract class Exceptions implements Exception {}

class ServerException implements Exceptions {
  final String? message;
  ServerException(this.message);
}
