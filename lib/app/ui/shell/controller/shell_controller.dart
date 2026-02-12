import '../../app/controllers/app_store.dart';
import '../../experience/experience_controller.dart';
import '../../home/home_controller.dart';
import 'shell_store.dart';

class ShellController {
  final ShellStore store;
  final AppStore appStore;
  final HomeController homeController;
  final ExperienceController experienceController;

  const ShellController({
    required this.store,
    required this.appStore,
    required this.homeController,
    required this.experienceController,
  });
}
