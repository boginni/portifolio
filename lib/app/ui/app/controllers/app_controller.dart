import 'package:flutter/material.dart';

import '../app_routes.dart';
import 'app_store.dart';

class AppController {
  final AppStore store;
  final AppRoutes appRoutes;

  const AppController(
    this.store,
    this.appRoutes,
  );

  void setThemeMode(ThemeMode? themeMode) {
    store.themeMode = themeMode;
  }

  void setLocale(Locale? locale) {
    store.locale = locale;
  }
}
