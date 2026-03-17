import 'package:flutter/material.dart';

import '../../../../app/generic_state_pages/generic_loading_state_page.dart';
import '../../../../app/store/generic_store.dart';
import '../../../about_site_controller.dart';
import 'about_site_page_wide_success_state.dart';

class AboutSitePageWide extends StatelessWidget {
  const AboutSitePageWide({
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
            GenericStoreSuccessState() => AboutSitePageWideSuccessState(
              value.dataObject,
              onRefresh: init,
            ),
          },
    );
  }
}
