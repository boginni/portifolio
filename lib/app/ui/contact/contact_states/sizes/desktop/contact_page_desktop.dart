import 'package:flutter/material.dart';

import '../../../../app/generic_state_pages/generic_failure_state_page.dart';
import '../../../../app/generic_state_pages/generic_loading_state_page.dart';
import '../../../../app/store/generic_store.dart';
import '../../../contact_controller.dart';
import 'contact_page_desktop_success_state.dart';

class ContactPageDesktop extends StatelessWidget {
  const ContactPageDesktop({
    super.key,
    required this.controller,
    required this.init,
  });

  final ContactController controller;
  final VoidCallback init;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.store,
      builder:
          (context, value, child) => switch (value) {
            GenericStoreInitialState() => const GenericLoadingStatePage(),
            GenericStoreSuccessState(dataObject: final contact) =>
              ContactPageSuccessStateDesktop(
                entity: contact,
              ),
            GenericStoreLoadingState() => const GenericLoadingStatePage(),
            GenericStoreFailureState() => GenericFailureStatePage(
              onTryAgain: init,
            ),
          },
    );
  }
}
