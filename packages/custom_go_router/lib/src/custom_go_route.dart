import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_transition.dart';
import 'route_wrapper.dart';
import 'router_config.dart';

class CustomGoRoute extends GoRoute {
  final AppRouteConfig config;
  final RouteTransition? transition;

  CustomGoRoute({
    required this.config,
    super.routes,
    super.redirect,
    this.transition,
  }) : super(
          path: config.fullPath,
          builder: (BuildContext context, GoRouterState state) {
            final params = {
              ...state.pathParameters,
              ...state.uri.queryParameters,
            };

            final extra = state.extra;

            return RouteWrapper(
              config: config,
              params: params,
              extra: extra,
            );
          },
        );
}
