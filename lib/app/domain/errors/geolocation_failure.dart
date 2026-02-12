import '../architecture/failure.dart';

enum GeolocationFailureType {
  permissionDenied,
  unknown,
  requestInProgress,
  timeout,
  disabled;

  static GeolocationFailureType fromFailure(GeolocationFailure failure) {
    if (failure.isPermissionDenied) {
      return GeolocationFailureType.permissionDenied;
    }

    if (failure.isDisabled) {
      return GeolocationFailureType.disabled;
    }

    if (failure.isRequestInProgress) {
      return GeolocationFailureType.requestInProgress;
    }

    if (failure.isTimeout) {
      return GeolocationFailureType.timeout;
    }

    if (failure.isUnknown) {
      return GeolocationFailureType.unknown;
    }

    throw AssertionError('Unknown failure type ');
  }
}

abstract class GeolocationFailure extends Failure {
  const GeolocationFailure(super.stackTrace);

  GeolocationFailureType get type => GeolocationFailureType.fromFailure(this);

  bool get isPermissionDenied => this is GeolocationPermissionDeniedFailure;

  bool get isDisabled => this is GeolocationDisabledFailure;

  bool get isRequestInProgress => this is GeolocationRequestInProgressFailure;

  bool get isTimeout => this is TimeoutGeolocationFailure;

  bool get isUnknown => this is UnknownGeolocationFailure;

  @override
  bool get isFatal => false;
}

class GeolocationDisabledFailure extends GeolocationFailure {
  const GeolocationDisabledFailure(super.stackTrace);
}

class GeolocationPermissionDeniedFailure extends GeolocationFailure {
  const GeolocationPermissionDeniedFailure(super.stackTrace);
}

class UnknownGeolocationFailure extends GeolocationFailure {
  const UnknownGeolocationFailure(super.stackTrace);
}

class GeolocationRequestInProgressFailure extends GeolocationFailure {
  const GeolocationRequestInProgressFailure(super.stackTrace);
}

class TimeoutGeolocationFailure extends GeolocationFailure {
  const TimeoutGeolocationFailure(super.stackTrace);
}
