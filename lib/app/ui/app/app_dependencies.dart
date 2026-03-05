import 'package:get_it/get_it.dart';

import '../../domain/repositories/resume_experiences_repository.dart';
import '../../domain/repositories/resume_overview_repository.dart';
import '../../external/repositories/resume_experiences_repository_impl.dart';
import '../../external/repositories/resume_overview_repository_impl.dart';
import 'controllers/app_store.dart';

class AppDependencies {
  static final GetIt _app = GetIt.asNewInstance();

  static void init() {
    _app.registerSingleton(AppStore());
    _app.registerFactory<ResumeOverviewRepository>(
      ResumeOverviewRepositoryImpl.new,
    );
    _app.registerFactory<ResumeExperiencesRepository>(
      ResumeExperiencesRepositoryImpl.new,
    );
  }

  static void restart() {
    _app.reset();
  }

  static T get<T extends Object>({
    dynamic param1,
    dynamic param2,
    String? instanceName,
    Type? type,
  }) => _app.get();
}
