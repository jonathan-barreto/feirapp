abstract class Failure {}

class ServerFailure extends Failure {}

class StorageFailure extends Failure {
  final String? message;

  StorageFailure({
    this.message,
  });
}
