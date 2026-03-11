import 'package:flutter/material.dart';

import '../../../../app/generic_state_pages/generic_failure_state_page.dart';
import '../../../../app/generic_state_pages/generic_loading_state_page.dart';
import '../../../controller/experience_controller.dart';
import '../../../controller/experience_store.dart';
import 'experience_page_success_state_ultra_wide.dart';

class ExperiencePageUltraWide extends StatelessWidget {
  const ExperiencePageUltraWide({
    super.key,
    required this.controller,
    required this.init,
  });

  final ExperienceController controller;
  final RefreshCallback init;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.store,
      builder:
          (context, ExperienceStoreState value, child) => switch (value) {
            ExperienceStoreInitialState() => const GenericLoadingStatePage(),
            ExperienceStoreSuccessState() => ExperiencePageSuccessStateUltraWide(
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
