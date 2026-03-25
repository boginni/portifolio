import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_purple_impl/flutter_purple_dependency.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repositories/resume_information_repository.dart';
import '../../external/datasource/resume_information_datasource.dart';
import '../../external/datasource/resume_information_datasource_debug.dart';
import '../../external/repositories/resume_information_repository_impl.dart';
import 'controllers/app_store.dart';

class AppDependencies {
  static final GetIt _app = GetIt.asNewInstance();

  static void init() {
    _init(_app);
  }

  static void _init(GetIt i) {
    PurpleDependency.init(i);

    i.registerSingleton(Dio());
    i.registerSingleton(AppStore());
    // --

    i.registerFactory<ResumeInformationDatasourceImpl>(
      () => ResumeInformationDatasourceImpl(
        i.get(),
        i.get(),
      ),
    );
    i.registerFactory<ResumeInformationDatasourceDebug>(
      () => ResumeInformationDatasourceDebug(
        i.get<ResumeInformationDatasourceImpl>(),
      ),
    );
    i.registerFactory<ResumeInformationDatasource>(
      () =>
          kDebugMode
              ? i.get<ResumeInformationDatasourceDebug>()
              : i.get<ResumeInformationDatasourceImpl>(),
    );
    i.registerFactory<ResumeInformationRepository>(
      () => ResumeInformationRepositoryImpl(
        i.get(),
      ),
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

  static void registerSingleton<T extends Object>(T instance) {
    _app.registerSingleton(instance);
  }
}
