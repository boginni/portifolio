import 'dart:async';

import 'failure.dart';

class Result<T> {
  const Result.failure(this._failure) : _success = null;

  const Result.success([this._success]) : _failure = null;

  factory Result.failureFromCatch(dynamic e, StackTrace s) {
    if (e is Failure) {
      return Result.failure(e);
    }

    return Result.failure(UnknownFailure(e, s));
  }

  static Future<Result<T>> capture<T>(
    FutureOr<Result<T>> Function() func,
  ) async {
    try {
      final result = func();

      if (result is Future) {
        final resolved = await result;

        return resolved;
      }

      return result;
    } catch (e, s) {
      return Result.failureFromCatch(e, s);
    }
  }

  final T? _success;

  final Failure? _failure;

  bool get isSuccess => _success != null;

  bool get isFailure => _failure != null;

  T get success {
    return _success as T;
  }

  Failure get failure {
    return _failure!;
  }
}

extension ResultExtension on Object {
  Result<T> toResult<T>() {
    if (this is Failure) {
      return Result.failure(this as Failure);
    }

    return Result.success(this as T);
  }
}
