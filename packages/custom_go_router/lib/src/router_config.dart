import 'package:flutter/widgets.dart';

abstract class AppRouteConfig {
  abstract final String fullPath;

  bool get isPublicRoute => true;

  String? get analyticsPageState => null;

  const AppRouteConfig();

  bool hasValidParams(Map<String, String> params, {Object? extra});

  AppRoute getRouteFromParams(Map<String, String> params);
}

abstract class AppRoute {
  AppRoute();

  String toPath();

  Widget toScreen({covariant Object? extra});
}

extension AppRouteX on AppRoute {
  Uri get toUri {
    return Uri.parse(toPath());
  }
}
