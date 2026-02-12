import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/dto/entities/cache_entity.dart';
import '../../domain/providers/cache_provider.dart';

class SharedPreferencesCacheProvider extends CacheProvider {
  SharedPreferencesCacheProvider({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<CacheEntity?> get(String key) async {
    final value = sharedPreferences.getString(key);

    if (value == null) {
      return null;
    }

    final json = const JsonDecoder().convert(value);

    return CacheEntity.fromJson(json);
  }

  @override
  Future<void> put(CacheEntity data) async {
    await sharedPreferences.setString(
      data.id,
      const JsonEncoder().convert(data.toJson()),
    );
  }
}
