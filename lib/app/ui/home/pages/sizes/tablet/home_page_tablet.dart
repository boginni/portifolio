import 'package:flutter/material.dart';

import '../../../../app/generic_state_pages/generic_failure_state_page.dart';
import '../../../../app/generic_state_pages/generic_loading_state_page.dart';
import '../../../home_controller.dart';
import '../../../home_store.dart';
import 'home_success_state_page_tablet.dart';

class HomePageTablet extends StatelessWidget {
  const HomePageTablet({
    super.key,
    required this.onRefresh,
    required this.controller,
  });

  final RefreshCallback onRefresh;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.store,
      builder:
          (context, HomeStoreState value, child) => switch (value) {
            HomeStoreInitialState() => const GenericLoadingStatePage(),
            HomeStoreSuccessState(overview: final overview) =>
              HomeSuccessStatePageTablet(
                overview,
                onRefresh: onRefresh,
              ),
            HomeStoreLoadingState() => const GenericLoadingStatePage(),
            HomeStoreFailureState() => GenericFailureStatePage(
              onTryAgain: onRefresh,
            ),
          },
    );
  }
}
