import '../app_routes.dart';
import 'app_store.dart';

class AppController {
  final AppStore store;
  final AppRoutes appRoutes;

  // final AltheroAliceAdapter alice;

  const AppController(
    this.store,
    this.appRoutes,
    // this.alice,
  );

  // void init() {
  //   final result = alice.init();
  //
  //   if (result.isFailure) {
  //     result.failure.throwError();
  //   }
  //
  //   alice.setNavigatorKey(appRoutes.navigatorKey);
  // }
  //
  // void openAlice() {
  //   alice.showInspector();
  // }
}
