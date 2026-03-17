import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/datasources/storage_datasource.dart';

final class StorageDatasourceImpl implements StorageDatasource {
  @override
  Future<void> save({
    required StorageEnum storage,
    required Map<String, dynamic> data,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(storage.name, jsonEncode(data));
  }

  @override
  Future<Map<String, dynamic>?> get(StorageEnum storageEnum) async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(storageEnum.name);
    if (data != null) {
      return jsonDecode(data);
    }
    return null;
  }

  @override
  Future<void> clear(StorageEnum storageEnum) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(storageEnum.name);
  }

  @override
  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    await Future.wait(keys.map(prefs.remove));
  }

  @override
  Future<Map<String, dynamic>?> getDynamicKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(key);
    if (data != null) {
      return jsonDecode(data);
    }
    return null;
  }

  @override
  Future<void> saveDynamicKey({
    required Map<String, dynamic> data,
    required String key,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(data));
  }
}
