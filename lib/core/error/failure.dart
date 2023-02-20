abstract class Failure {
  final int statusCode;
  final String message;

  Failure(this.statusCode, this.message);
}

class ClientFailure extends Failure {
  ClientFailure(super.statusCode, super.message);
}

class ServerError extends Failure {
  ServerError(super.statusCode, super.message);
}
