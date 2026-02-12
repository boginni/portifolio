import 'package:vector_math/vector_math.dart';

import '../enums/geolocation_permission_status_enum.dart';

abstract interface class GeolocationRepository {
  Future<Vector2> getCurrentPosition();

  Future<GeolocationPermissionStatus> getCurrentPermissionStatus();
}
