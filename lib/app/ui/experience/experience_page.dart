import 'package:flutter/material.dart';
import '../app/generic_state_pages/generic_failure_state_page.dart';
import '../app/generic_state_pages/generic_loading_state_page.dart';
import 'experience_controller.dart';
import 'experience_states/experience_success_state_page.dart';
import 'experience_store.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key, required this.controller});

  final ExperienceController controller;

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
    return ValueListenableBuilder(
      valueListenable: controller.store,
      builder:
          (context, ExperienceStoreState value, child) => switch (value) {
            ExperienceStoreInitialState() => const GenericLoadingStatePage(),
            ExperienceStoreSuccessState() => ExperienceSuccessStatePage(
              value,
              onRefresh: init,
            ),
            ExperienceStoreLoadingState() => const GenericLoadingStatePage(),
            ExperienceStoreFailureState() => GenericFailureStatePage(
              onTryAgain: init,
            ),
          },
    );
  }
}
