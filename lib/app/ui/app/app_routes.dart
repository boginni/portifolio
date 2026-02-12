import 'package:custom_go_router/custom_go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shell/shell_routes.dart';
import '../splash/splash_route.dart';

class AppRoutes {
  AppRoutes();

  GoRouter? _router;

  final navigatorKey = GlobalKey<NavigatorState>();

  GoRouter get routes {
    return _router ??= GoRouter(
      initialLocation: SplashRoute().toPath(),
      navigatorKey: navigatorKey,
      routes: [
        CustomGoRoute(
          config: SplashRouteConfig(),
        ),
        CustomGoRoute(
          config: ShellRouteConfig(),
        ),
      ],
    );
  }
}
