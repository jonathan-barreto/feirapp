abstract class Failure {}

class ServerFailure extends Failure {
  final String? message;

  ServerFailure({
    this.message,
  });
}

class StorageFailure extends Failure {
  final String? message;

  StorageFailure({
    this.message,
  });
}
