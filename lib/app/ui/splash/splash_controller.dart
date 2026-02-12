import '../app/controllers/app_store.dart';
import 'splash_store.dart';

class SplashController {
  final AppStore appStore;
  final SplashStore store;

  const SplashController({
    required this.appStore,
    required this.store,
  });
}
