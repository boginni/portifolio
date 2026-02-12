import '../dto/entities/cache_entity.dart';

abstract class CacheProvider {
  Future<CacheEntity?> get(String key);

  Future<void> put(CacheEntity data);
}
