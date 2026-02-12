import '../dto/entities/preferences_entity.dart';

abstract interface class PreferencesRepository {
  const PreferencesRepository();

  Future<void> save(PreferencesEntity preferencesEntity);

  Future<PreferencesEntity> get();
}
