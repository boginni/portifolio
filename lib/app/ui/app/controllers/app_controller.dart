import 'package:flutter/material.dart';

import '../../../domain/repositories/preferences_repository.dart';
import '../app_routes.dart';
import 'app_store.dart';

class AppController {
  final AppStore store;
  final AppRoutes appRoutes;

  final PreferencesRepository preferencesRepository;

  const AppController(
    this.preferencesRepository, {
    required this.store,
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
  }
}
