import '../app/controllers/app_controller.dart';
import 'splash_store.dart';

class SplashController {
  final SplashStore store;
  final AppController appController;

  const SplashController(
    this.appController, {
    required this.store,
  });
}
