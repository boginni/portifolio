import 'package:custom_go_router/custom_go_router.dart';
import 'package:flutter/material.dart';

import '../app/app_dependencies.dart';
import '../app/controllers/app_store.dart';
import 'splash_controller.dart';
import 'splash_page.dart';
import 'splash_store.dart';

class SplashRouteConfig extends AppRouteConfig {
  static const basePath = 'splash';

  @override
  final fullPath = '/$basePath';

  @override
  bool hasValidParams(Map<String, String> params, {Object? extra}) {
    return true;
  }

  @override
  AppRoute getRouteFromParams(Map<String, String> params) {
    return SplashRoute();
  }
}

class SplashRoute extends AppRoute {
  SplashRoute();

  late final AppStore appStore = AppDependencies.get();
  late final store = SplashStore();

  @override
  String toPath() =>
      Uri(
        path: '/${SplashRouteConfig.basePath}',
      ).toString();

  @override
  Widget toScreen({Object? extra}) {
    return SplashPage(
      controller: SplashController(
        appStore: appStore,
        store: store,
      ),
    );
  }
}
