import 'package:flutter/material.dart';

class PreferencesEntity {
  const PreferencesEntity({
    required this.beaconDriver,
    required this.themeMode,
    required this.locale,
  });

  final bool beaconDriver;
  final ThemeMode themeMode;
  final Locale locale;

  PreferencesEntity copyWith({
    bool? beaconDriver,
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return PreferencesEntity(
      beaconDriver: beaconDriver ?? this.beaconDriver,
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}
