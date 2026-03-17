import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

class AppStore extends ChangeNotifier implements ValueListenable<AppStore> {
  AppStore();

  @override
  AppStore get value => this;

  ThemeMode? _themeMode;

  Locale? _locale;

  Vector2? initialPosition;

  ThemeMode? get themeMode => _themeMode;

  Locale? get locale => _locale;

  Stream<Locale> get changeLanguageNotifier =>
      changeLanguageNotifierController.stream;

  final changeLanguageNotifierController = StreamController<Locale>.broadcast();

  set themeMode(ThemeMode? value) {
    _themeMode = value;
    notifyListeners();
  }

  set locale(Locale? value) {
    _locale = value;
    notifyListeners();
  }
}
