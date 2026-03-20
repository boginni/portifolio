import 'package:flutter/material.dart';

import '../../../../app/generic_state_pages/generic_loading_state_page.dart';
import '../../../../app/store/generic_store.dart';
import '../../../about_site_controller.dart';
import 'about_site_page_desktop_success_state.dart';

class AboutSitePageDesktop extends StatelessWidget {
  const AboutSitePageDesktop({
    super.key,
    required this.controller,
    required this.init,
  });

  final AboutSiteController controller;
  final RefreshCallback init;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.store,
      builder:
          (context, value, child) => switch (value) {
            GenericStoreInitialState() => const GenericLoadingStatePage(),
            GenericStoreLoadingState() => const GenericLoadingStatePage(),
            GenericStoreFailureState() => const GenericLoadingStatePage(),
            GenericStoreSuccessState() => AboutSitePageDesktopSuccessState(
              value.dataObject,
              onRefresh: init,
              onTapRepository: controller.launchRepository,
            ),
          },
    );
  }
}
