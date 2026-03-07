import 'package:flutter/material.dart';
import '../app/components/responsive_builder.dart';
import '../app/generic_state_pages/generic_failure_state_page.dart';
import '../app/generic_state_pages/generic_loading_state_page.dart';
import 'experience_controller.dart';
import 'pages/sizes/phone/experience_page_phone.dart';
import 'pages/sizes/phone/experience_page_success_state_phone.dart';
import 'experience_store.dart';
import 'pages/sizes/ultra_wide/experience_page_ultra_wide.dart';
import 'pages/sizes/wide/experience_page_wide.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({
    super.key,
    required this.controller,
    this.forcedDisplaySize,
  });

  final ExperienceController controller;
  final ResponsiveDisplaySizeEnum? forcedDisplaySize;

  @override
  State<ExperiencePage> createState() => _ExperiencePAgeState();
}

class _ExperiencePAgeState extends State<ExperiencePage> {
  ExperienceController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (controller.store.value is ExperienceStoreInitialState) {
          init();
        }
      },
    );
  }

  Future<void> init() async {
    await controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      phone:
          (context) => ExperiencePagePhone(
            controller: controller,
            init: init,
          ),
      ultraWide:
          (context) => ExperiencePageUltraWide(
            controller: controller,
            init: init,
          ),
      wide:
          (context) => ExperiencePageWide(
            controller: controller,
            init: init,
          ),
    );
  }
}
