import 'package:flutter/material.dart';

class MaterialTheme {
  const MaterialTheme();

  ThemeData getTheme({
    required TextTheme textTheme,
    required ColorScheme colorScheme,
    Iterable<ThemeExtension<dynamic>>? extensions,
  }) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    extensions: extensions,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(),
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: colorScheme.primaryContainer,
      iconTheme: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(
              color: colorScheme.onPrimaryContainer,
            );
          }

          return null;
        },
      ),
      // iconTheme: ,
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return textTheme.bodyMedium?.copyWith(
              color: colorScheme.onPrimaryContainer,
            );
          }

          return null;
        },
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: colorScheme.primary,
          width: 2,
        ),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 32,
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 32,
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      surfaceTintColor: Colors.transparent,
      backgroundColor: colorScheme.surface,
      elevation: 0,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: colorScheme.surfaceContainerHigh,
        foregroundColor: colorScheme.onSurfaceVariant,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainer,
      labelStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      iconColor: colorScheme.onSurfaceVariant,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
    ),
  );
}
