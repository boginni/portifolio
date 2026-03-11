import 'dart:typed_data';

import 'package:custom_go_router/custom_go_router.dart';
import 'package:flutter/material.dart';

import '../../domain/dto/entities/resume_about_site_entity.dart';
import '../../domain/dto/entities/resume_contact_entity.dart';
import '../../domain/dto/entities/resume_skills_entity.dart';
import '../about_site/about_site_controller.dart';
import '../app/app_dependencies.dart';
import '../app/controllers/app_store.dart';
import '../app/store/generic_store.dart';
import '../contact/contact_controller.dart';
import '../experience/controller/experience_controller.dart';
import '../experience/controller/experience_store.dart';
import '../home/home_controller.dart';
import '../home/home_store.dart';
import '../pdf/pdf_controller.dart';
import '../pdf/pages/resume_pdf_service.dart';
import '../skills/controllers/skills_controller.dart';
import 'controller/shell_controller.dart';
import 'controller/shell_store.dart';
import 'shell_page.dart';

class ShellRouteConfig extends AppRouteConfig {
  static const basePath = 'shell';

  @override
  final fullPath = '/$basePath';

  @override
  bool hasValidParams(Map<String, String> params, {Object? extra}) {
    return true;
  }

  @override
  AppRoute getRouteFromParams(Map<String, String> params) {
    return ShellRoute();
  }
}

class ShellRoute extends AppRoute {
  ShellRoute();

  late final store = ShellStore();
  late final homeStore = HomeStore();
  late final experienceStore = ExperienceStore();
  late final contactStore = GenericStore<ResumeContactEntity>();
  late final skillsStore = GenericStore<ResumeSkillsEntity>();
  late final aboutStore = GenericStore<ResumeAboutSiteEntity>();
  late final resumePdfService = GenericStore<Uint8List>();

  late final appStore = AppDependencies.get<AppStore>();

  late final shellController = ShellController(
    appStore: appStore,
    store: store,
    homeController: HomeController(
      AppDependencies.get(),
      store: homeStore,
    ),
    experienceController: ExperienceController(
      AppDependencies.get(),
      store: experienceStore,
    ),
    contactController: ContactController(
      AppDependencies.get(),
      store: contactStore,
    ),
    skillsController: SkillsController(
      AppDependencies.get(),
      store: skillsStore,
    ),
    pdfController: PdfController(
      AppDependencies.get(),
      ResumePdfService(),
      store: resumePdfService,
    ),
    aboutSiteController: AboutSiteController(
      AppDependencies.get(),
      store: aboutStore,
    ),
  );

  @override
  String toPath() =>
      Uri(
        path: '/${ShellRouteConfig.basePath}',
      ).toString();

  @override
  Widget toScreen({Object? extra}) {
    return ShellPage(
      controller: shellController,
    );
  }
}
