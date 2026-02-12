import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router_config.dart';

extension RouteExtensions on BuildContext {
  void goToRoute(AppRoute route, {Object? extra}) {
    if (GoRouter.maybeOf(this) == null) {
      return;
    }
    go(route.toPath(), extra: extra);
  }

  void goToRouteConfig(AppRouteConfig route, {Object? extra}) {
    if (GoRouter.maybeOf(this) == null) {
      return;
    }

    go(route.fullPath, extra: extra);
  }

  Future<T?> pushRoute<T extends Object?>(
    AppRoute route, {
    Object? extra,
  }) {
    if (GoRouter.maybeOf(this) == null) {
      return Future.value();
    }
    return push<T>(route.toPath(), extra: extra);
  }

  bool maybePop<T extends Object?>([T? result]) {
    if (GoRouter.maybeOf(this) == null) return false;
    if (!canPop()) return false;

    pop<T>(result);
    return true;
  }

  void pushReplacementRoute(AppRoute route, {Object? extra}) {
    return pushReplacement(route.toPath(), extra: extra);
  }

  void replaceWithRoute(AppRoute route, {Object? extra}) {
    return replace(route.toPath(), extra: extra);
  }

  @Deprecated('goToRoute is preferred')
  Future<T?> pushAndPopUntilRoutePath<T extends Object?>(
    AppRoute route,
    bool Function(GoRoute route)? predicate, {
    Object? extra,
  }) {
    if (predicate != null) {
      popUntilRoutePath(predicate);
    }

    return pushRoute<T>(route, extra: extra);
  }

  @Deprecated('Not safe')
  void popUntilRoutePath<T extends Object?>(
    bool Function(GoRoute route) predicate, {
    Object? extra,
  }) {
    final currentConfiguration =
        GoRouter.of(this).routerDelegate.currentConfiguration;

    final routesToPop = currentConfiguration.routes
        .where(
          (r) => predicate(r as GoRoute),
        )
        .toList()
        .reversed;

    for (final _ in routesToPop) {
      if (canPop()) {
        pop();
      }
    }
  }

  String? getLastRoutePath() {
    final matchesList =
        GoRouter.of(this).routerDelegate.currentConfiguration.matches;

    if (matchesList.isEmpty) {
      return null;
    }

    return (matchesList.last.route as GoRoute).path;
  }
}

extension GoRouteExtension on GoRoute {
  bool isFirstRoute() {
    final slashIndex = path.indexOf('/');

    return slashIndex == -1;
  }
}
