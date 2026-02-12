import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:vector_math/vector_math.dart';

import '../../domain/enums/geolocation_permission_status_enum.dart';
import '../../domain/errors/geolocation_failure.dart';
import '../../domain/extensions/position_extensions.dart';
import '../../domain/repositories/geolocation_repository.dart';

class GeolocationRepositoryImpl implements GeolocationRepository {
  @override
  Future<Vector2> getCurrentPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition().timeout(
        const Duration(seconds: 15),
      );

      return position.toVector2();
    } catch (e, s) {
      final failure = _handleFailure(e, s);

      if (failure != null) {
        throw failure;
      }

      rethrow;
    }
  }

  Exception? _handleFailure(dynamic e, StackTrace s) {
    if (e is ActivityMissingException) {
      return UnknownGeolocationFailure(s);
    }

    if (e is PermissionDefinitionsNotFoundException) {
      return UnknownGeolocationFailure(s);
    }

    if (e is PositionUpdateException) {
      return UnknownGeolocationFailure(s);
    }

    if (e is AlreadySubscribedException) {
      return GeolocationRequestInProgressFailure(s);
    }

    if (e is PermissionRequestInProgressException) {
      return GeolocationRequestInProgressFailure(s);
    }

    if (e is LocationServiceDisabledException) {
      return GeolocationDisabledFailure(s);
    }

    if (e is PermissionDeniedException) {
      return GeolocationPermissionDeniedFailure(s);
    }

    if (e is TimeoutException) {
      return TimeoutGeolocationFailure(s);
    }

    return null;
  }

  @override
  Future<GeolocationPermissionStatus> getCurrentPermissionStatus() async {
    final permission = await Geolocator.checkPermission();

    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return GeolocationPermissionStatus.granted;
      case LocationPermission.denied:
        return GeolocationPermissionStatus.denied;
      case LocationPermission.deniedForever:
        return GeolocationPermissionStatus.deniedForever;
      default:
        return GeolocationPermissionStatus.unknown;
    }
  }
}
