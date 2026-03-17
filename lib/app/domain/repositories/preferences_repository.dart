import 'package:error_handler_with_result/error_handler_with_result.dart';

import '../dto/entities/preferences_entity.dart';

abstract interface class PreferencesRepository {
  const PreferencesRepository();

  Future<Result> save(PreferencesEntity preferencesEntity);

  Future<Result<PreferencesEntity>> get();
}
