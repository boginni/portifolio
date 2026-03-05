import 'package:flutter/material.dart';
import 'experience_controller.dart';
import 'Experience_states/Experience_failure_state_page.dart';
import 'Experience_states/Experience_loading_state_page.dart';
import 'Experience_states/Experience_success_state_page.dart';
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
            ExperienceStoreInitialState() => const ExperienceLoadingStatePage(),
            ExperienceStoreSuccessState() => ExperienceSuccessStatePage(
              value,
              onRefresh: init,
            ),
            ExperienceStoreLoadingState() => const ExperienceLoadingStatePage(),
            ExperienceStoreFailureState() => const ExperienceFailureStatePage(),
          },
    );
  }
}
