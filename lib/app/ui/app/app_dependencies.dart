import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repositories/resume_information_repository.dart';
import '../../external/datasource/resume_information_datasource.dart';
import '../../external/datasource/resume_information_datasource_debug.dart';
import '../../external/repositories/resume_information_repository_impl.dart';
import 'controllers/app_store.dart';

class AppDependencies {
  static final GetIt _app = GetIt.asNewInstance();

  static void init() {
    _app.registerSingleton(Dio());
    _app.registerSingleton(AppStore());
    _app.registerFactory<ResumeInformationDatasource>(
      () =>
          kDebugMode
              ? ResumeInformationDatasourceDebug(_app.get())
              : ResumeInformationDatasourceImpl(_app.get()),
    );
    _app.registerFactory<ResumeInformationRepository>(
      () => ResumeInformationRepositoryImpl(
        _app.get(),
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
}
