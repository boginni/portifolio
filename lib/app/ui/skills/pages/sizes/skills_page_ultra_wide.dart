import 'package:flutter/material.dart';

import '../../../app/generic_state_pages/generic_loading_state_page.dart';
import '../../../app/store/generic_store.dart';
import '../../controllers/skills_controller.dart';
import 'skills_page_ultra_wide_success_state.dart';

class SkillsPageUltraWide extends StatelessWidget {
  const SkillsPageUltraWide({
    super.key,
    required this.controller,
    required this.init,
  });

  final SkillsController controller;
  final VoidCallback init;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.store,
      builder: (context, value, child) {
        return switch (value) {
          GenericStoreInitialState() => const GenericLoadingStatePage(),
          GenericStoreLoadingState() => const GenericLoadingStatePage(),
          GenericStoreFailureState() => const GenericLoadingStatePage(),
          GenericStoreSuccessState() => SkillsPageUltraWideSuccessState(
            entity: value.dataObject,
          ),
        };
      },
    );
  }
}
