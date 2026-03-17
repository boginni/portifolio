import 'package:flutter/material.dart';

import '../../../domain/dto/entities/preferences_entity.dart';

class PreferencesModel {
  final bool beaconDriver;
  final bool firstAccess;
  final ThemeMode themeMode;
  final Locale locale;

  const PreferencesModel({
    required this.beaconDriver,
    required this.firstAccess,
    required this.themeMode,
    required this.locale,
  });

  factory PreferencesModel.fromEntity(PreferencesEntity entity) {
    return PreferencesModel(
      beaconDriver: entity.beaconDriver,
      firstAccess: entity.firstAccess,
      themeMode: entity.themeMode,
      locale: entity.locale,
    );
  }

  PreferencesEntity toEntity() {
    return PreferencesEntity(
      beaconDriver: beaconDriver,
      firstAccess: firstAccess,
      themeMode: themeMode,
      locale: locale,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'beaconDriver': beaconDriver,
      'firstAccess': firstAccess,
      'themeMode': themeMode.toString(),
      'locale': locale.toString(),
    };
  }

  factory PreferencesModel.defaultPreferences() {
    return const PreferencesModel(
      beaconDriver: false,
      firstAccess: true,
      themeMode: ThemeMode.system,
      locale: Locale('en', 'US'),
    );
  }

  factory PreferencesModel.fromJson(Map<String, dynamic> json) {
    final locale = json['locale']?.split('_') as List?;
    final languageCode = locale?.elementAtOrNull(0);
    final countryCode = locale?.elementAtOrNull(1);

    return PreferencesModel(
      beaconDriver: json['beaconDriver'],
      firstAccess: json['firstAccess'],
      themeMode: ThemeMode.values.firstWhere(
        (e) => e.toString() == json['themeMode'],
        orElse: () => ThemeMode.system,
      ),
      locale: Locale.fromSubtags(
        languageCode: languageCode ?? 'en',
        countryCode: countryCode,
      ),
    );
  }
}
