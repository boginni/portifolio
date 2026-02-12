import 'package:flutter/material.dart';

import 'app/ui/app/app_dependencies.dart';
import 'app/ui/app/app_routes.dart';
import 'app/ui/app/app_widget.dart';
import 'app/ui/app/controllers/app_controller.dart';
import 'app/ui/app/controllers/app_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
  //
  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };
  //
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

  AppDependencies.init();

  runApp(
    AppWidget(
      controller: AppController(
        AppStore(),
        AppRoutes(),
      ),
    ),
  );
}
