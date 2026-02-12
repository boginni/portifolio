import 'package:get_it/get_it.dart';

import 'controllers/app_store.dart';

class AppDependencies {
  static final GetIt _app = GetIt.asNewInstance();

  static void init() {
    _app.registerSingleton(AppStore());
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
