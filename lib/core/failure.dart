abstract class Failure {
  String failureMessage;
  Failure(this.failureMessage);
}

class NetworkFailure extends Failure {
  NetworkFailure({String failureMessage = "Network Failure"})
      : super(failureMessage);
}
class ServerFailure extends Failure {
  ServerFailure({String failureMessage = "Server Failure"})
      : super(failureMessage);
}
