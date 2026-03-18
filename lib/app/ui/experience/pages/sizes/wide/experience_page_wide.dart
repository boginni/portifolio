import 'package:flutter/material.dart';

import '../../../../app/generic_state_pages/generic_failure_state_page.dart';
import '../../../../app/generic_state_pages/generic_loading_state_page.dart';
import '../../../controller/experience_controller.dart';
import '../../../controller/experience_store.dart';
import '../desktop/experience_page_desktop_loading_state.dart';
import 'experience_page_wide_success_state.dart';

class ExperiencePageWide extends StatelessWidget {
  const ExperiencePageWide({
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
            ExperienceStoreSuccessState() => ExperiencePageWideSuccessState(
              value,
              onRefresh: init,
            ),
            ExperienceStoreLoadingState() => const ExperiencePageDesktopLoadingState(),
            ExperienceStoreFailureState() => GenericFailureStatePage(
              onTryAgain: init,
            ),
          },
    );
  }
}
