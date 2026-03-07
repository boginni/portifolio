import 'package:flutter/material.dart';

import '../../../../app/generic_state_pages/generic_failure_state_page.dart';
import '../../../../app/generic_state_pages/generic_loading_state_page.dart';
import '../../../../app/store/generic_store.dart';
import '../../../contact_controller.dart';
import 'contact_page_success_state_wide.dart';

class ContactPageWide extends StatelessWidget {
  const ContactPageWide({
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
              ContactPageSuccessStateWide(
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
