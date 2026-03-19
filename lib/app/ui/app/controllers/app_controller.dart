import 'package:flutter/material.dart';
import 'package:flutter_purple_domains/flutter_purple_domains.dart';

import '../app_routes.dart';
import 'app_store.dart';

class AppController {
  final AppStore store;
  final AppRoutes appRoutes;

  final PreferencesRepository preferencesRepository;

  const AppController(
    this.preferencesRepository,
    this.store, {
    required this.appRoutes,
  });

  Future<void> loadPreferences() async {
    final result = await preferencesRepository.get();

    if (result.isFailure) {
      result.failure.throwError();
    }

    store.themeMode = result.success.themeMode;
    store.locale = result.success.locale;
  }

  Future<void> setThemeMode(ThemeMode? themeMode) async {
    store.themeMode = themeMode;

    final result = await preferencesRepository.get();

    if (result.isFailure) {
      result.failure.throwError();
    }

    await preferencesRepository.save(
      result.success.copyWith(
        themeMode: themeMode,
      ),
    );
  }

  Future<void> setLocale(Locale? locale) async {
    if (locale == null) {
      return;
    }

    store.locale = locale;

    final result = await preferencesRepository.get();

    if (result.isFailure) {
      result.failure.throwError();
    }

    await preferencesRepository.save(
      result.success.copyWith(
        locale: locale,
      ),
    );

    store.changeLanguageNotifierController.sink.add(locale);
  }
}
