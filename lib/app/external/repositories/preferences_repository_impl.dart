import 'package:error_handler_with_result/error_handler_with_result.dart';

import '../../domain/dto/entities/preferences_entity.dart';
import '../../domain/repositories/preferences_repository.dart';
import '../datasource/preferences_datasource.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  const PreferencesRepositoryImpl(this.datasource);

  final PreferencesDatasource datasource;

  @override
  Future<Result<PreferencesEntity>> get() async {
    try {
      final data = await datasource.get();
      return Result.success(
        data,
      );
    } catch (e, s) {
      return Result.failureFromCatch(e, s);
    }
  }

  @override
  Future<Result> save(PreferencesEntity entity) async {
    try {
      await datasource.save(entity);
      return const Result.success();
    } catch (e, s) {
      return Result.failureFromCatch(e, s);
    }
  }
}
