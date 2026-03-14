import '../../about_site/about_site_controller.dart';
import '../../app/controllers/app_controller.dart';
import '../../contact/contact_controller.dart';
import '../../experience/controller/experience_controller.dart';
import '../../home/home_controller.dart';
import '../../pdf/pdf_controller.dart';
import '../../skills/controllers/skills_controller.dart';
import 'shell_store.dart';

class ShellController {
  final ShellStore store;
  final AppController appController;
  final HomeController homeController;
  final ExperienceController experienceController;
  final ContactController contactController;
  final SkillsController skillsController;
  final PdfController pdfController;
  final AboutSiteController aboutSiteController;

  const ShellController({
    required this.pdfController,
    required this.store,
    required this.appController,
    required this.homeController,
    required this.experienceController,
    required this.contactController,
    required this.skillsController,
    required this.aboutSiteController,
  });
}
