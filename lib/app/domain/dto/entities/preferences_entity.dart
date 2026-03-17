import 'package:flutter/material.dart';

class PreferencesEntity {
  const PreferencesEntity({
    required this.beaconDriver,
    required this.themeMode,
    required this.firstAccess,
    required this.locale,
  });

  final bool beaconDriver;
  final bool firstAccess;
  final ThemeMode themeMode;
  final Locale locale;

  PreferencesEntity copyWith({
    bool? beaconDriver,
    ThemeMode? themeMode,
    bool? firstAccess,
    Locale? locale,
  }) {
    return PreferencesEntity(
      beaconDriver: beaconDriver ?? this.beaconDriver,
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      firstAccess: firstAccess ?? this.firstAccess,
    );
  }
}
