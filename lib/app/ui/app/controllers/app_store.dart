import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

class AppStore extends ChangeNotifier implements ValueListenable<AppStore> {
  AppStore();

  @override
  AppStore get value => this;

  ThemeMode? themeMode;

  Locale? locale;

  Vector2? initialPosition;
}
