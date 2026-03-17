enum StorageEnum { preferences, credentials }

abstract interface class StorageDatasource {
  const StorageDatasource();

  Future<void> save({
    required StorageEnum storage,
    required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>?> get(StorageEnum storageEnum);

  Future<void> clear(StorageEnum storageEnum);

  Future<void> clearAll();

  Future<Map<String, dynamic>?> getDynamicKey(String key);

  Future<void> saveDynamicKey({
    required Map<String, dynamic> data,
    required String key,
  });
}
