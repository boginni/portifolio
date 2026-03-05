import 'package:custom_go_router/custom_go_router.dart';
import 'package:flutter/material.dart';

import '../app/app_dependencies.dart';
import '../app/controllers/app_store.dart';
import '../experience/experience_controller.dart';
import '../experience/experience_store.dart';
import '../home/home_controller.dart';
import '../home/home_store.dart';
import 'controller/shell_controller.dart';
import 'controller/shell_store.dart';
import 'shell_page.dart';

class ShellRouteConfig extends AppRouteConfig {
  static const basePath = 'shell';

  @override
  final fullPath = '/$basePath';

  @override
  bool hasValidParams(Map<String, String> params, {Object? extra}) {
    return true;
  }

  @override
  AppRoute getRouteFromParams(Map<String, String> params) {
    return ShellRoute();
  }
}

class ShellRoute extends AppRoute {
  ShellRoute();

  late final store = ShellStore();
  late final appStore = AppDependencies.get<AppStore>();

  late final shellController = ShellController(
    appStore: appStore,
    store: store,
    homeController: HomeController(
      AppDependencies.get(),
      store: HomeStore(),
    ),
    experienceController: ExperienceController(
      AppDependencies.get(),
      store: ExperienceStore(),
    ),
  );

  @override
  String toPath() =>
      Uri(
        path: '/${ShellRouteConfig.basePath}',
      ).toString();

  @override
  Widget toScreen({Object? extra}) {
    return ShellPage(
      controller: shellController,
    );
  }
}
