import '../../domain/datasources/storage_datasource.dart';
import '../../domain/dto/entities/preferences_entity.dart';
import '../dto/model/preferences_model.dart';

class PreferencesDatasource {
  const PreferencesDatasource(this.datasource);

  final StorageDatasource datasource;

  Future<PreferencesEntity> get() async {
    final data = await datasource.get(StorageEnum.preferences);

    if (data == null) {
      return PreferencesModel.defaultPreferences().toEntity();
    }

    return PreferencesModel.fromJson(data).toEntity();
  }

  Future<void> save(PreferencesEntity entity) async {
    return datasource.save(
      storage: StorageEnum.preferences,
      data: PreferencesModel.fromEntity(entity).toJson(),
    );
  }
}
