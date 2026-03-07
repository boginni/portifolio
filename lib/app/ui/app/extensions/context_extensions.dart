import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

import '../../../../gen/app_localizations.g.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  AppLocalizations get l10n => AppLocalizations.of(this)!;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  Locale get locale => Localizations.localeOf(this);

  bool get isDarkMode => theme.brightness == Brightness.dark;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  NavigatorState get navigator => Navigator.of(this);

  void runIfMounted(VoidCallback fn) {
    if (mounted) {
      fn();
    }
  }
}

extension ChangeNotifierExtension on Listenable {
  void addListenerPage(void Function(VoidCallback fn) setState) {
    addListener(() => setState(() {}));
  }

  void addListenerState(State state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ignore: invalid_use_of_protected_member
      addListener(() => state.setState(() {}));
    });
  }
}

extension SizeExtensions on Size {
  Size withPadding({
    double horizontal = 0.0,
    double vertical = 0.0,
  }) {
    return Size(
      width - horizontal,
      height - vertical,
    );
  }

  Vector2 toVector2() {
    return Vector2(width, height);
  }
}

extension DurationFormatting on Duration {
  String formatHMS(BuildContext context) {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }

    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
