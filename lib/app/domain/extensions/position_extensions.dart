import 'dart:math' as math;

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vector_math/vector_math.dart';

import 'num_extensions.dart';

const _earthRadius = 6371;

extension LatLngExtension on LatLng {
  Vector2 toVector2() => Vector2(latitude, longitude);
}

extension PositionExtensions on Position {
  Vector2 toVector2() => Vector2(latitude, longitude);
}

extension Vector2Extensions on Vector2 {
  double getHaversineDistanceInKm(Vector2 other, {int precision = 2}) {
    final deltaRad = other.toRadians() - toRadians();

    final sinDeltaLatSquared = math.pow(math.sin(deltaRad.x / precision), 2);
    final sinDeltaLonSquared = math.pow(math.sin(deltaRad.y / precision), 2);

    final cosLat1 = math.cos(x.toRadians());
    final cosLat2 = math.cos(other.x.toRadians());
    final cosLatProduct = cosLat1 * cosLat2;

    final haversineTerm =
        sinDeltaLatSquared + (cosLatProduct * sinDeltaLonSquared);

    final centralAngle =
        precision *
        math.atan2(math.sqrt(haversineTerm), math.sqrt(1.0 - haversineTerm));

    return _earthRadius * centralAngle;
  }

  Vector2 getCenterPoint(Vector2 other) => (this + other) / 2.0;

  Vector2 toRadians() => Vector2(
    x.toRadians(),
    y.toRadians(),
  );

  LatLng toLatLng() => LatLng(x, y);

  Position toPosition() => Position(
    latitude: x,
    longitude: y,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
    altitudeAccuracy: 0,
    headingAccuracy: 0,
    isMocked: true,
  );

  CameraPosition toCameraPosition({
    double zoom = 14.5,
  }) => CameraPosition(
    target: toLatLng(),
    zoom: zoom,
  );

  Vector2 get log => Vector2(math.log(x), math.log(y));

  Vector2 get abs => Vector2(x.abs(), y.abs());

  double get min => math.min(x, y);

  double get max => math.max(x, y);

  double get magnitude => delta.abs();

  double get delta => x - y;
}

extension Vector2ListExtensions on List<Vector2> {
  Vector2 getCentroid() {
    final sum = reduce((value, element) => value + element);
    return sum / length.toDouble();
  }

  Vector2 getHaversineFurthestPoint(Vector2 center) {
    final distances = map((point) => point.getHaversineDistanceInKm(center));
    final maxDistance = distances.reduce(math.max);
    final index = distances.toList().indexOf(maxDistance);
    return this[index];
  }

  Vector2 getHaversineFurthestPointFromCentroid() {
    final centroid = getCentroid();
    return getHaversineFurthestPoint(centroid);
  }

  List<LatLng> toLatLngList() => map((point) => point.toLatLng()).toList();
}

extension PointLatLngExtension on PointLatLng {
  Vector2 toVector2() => Vector2(
    latitude,
    longitude,
  );
}

extension ListPointLatLngExtension on List<PointLatLng> {
  List<Vector2> toVector2List() => map((point) => point.toVector2()).toList();
}
