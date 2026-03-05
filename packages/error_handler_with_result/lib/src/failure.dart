abstract class Failure implements Exception {
  const Failure(this.stackTrace);

  final StackTrace stackTrace;

  bool get isFatal;

  Never throwError() {
    final string = toString();

    const maxLength = 1024 * 4;

    if (string.length > maxLength) {
      final clipped = string.substring(0, maxLength);

      Error.throwWithStackTrace(
        Exception('Failure message too long, clipped: $clipped'),
        stackTrace,
      );
    }

    Error.throwWithStackTrace(
      this,
      stackTrace,
    );
  }
}

class SerializationFailure extends Failure {
  const SerializationFailure(this.error, StackTrace stackTrace)
      : super(stackTrace);

  final dynamic error;

  @override
  bool get isFatal => true;
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(super.stackTrace);

  @override
  bool get isFatal => true;
}

class UnknownFailure extends Failure {
  const UnknownFailure(this.message, super.stackTrace);

  final dynamic message;

  @override
  bool get isFatal => true;

  @override
  String toString() {
    final Object? message = this.message;

    if (message == null) {
      return 'UnknownFailure';
    }

    return 'UnknownFailure: $message';
  }
}

class TestFailure extends Failure {
  const TestFailure([super.stackTrace = StackTrace.empty]);

  @override
  bool get isFatal => false;
}
