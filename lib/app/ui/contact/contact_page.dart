import 'package:flutter/material.dart';
import '../app/generic_state_pages/generic_failure_state_page.dart';
import '../app/generic_state_pages/generic_loading_state_page.dart';
import '../app/store/generic_store.dart';
import 'contact_controller.dart';
import 'contact_states/contact_success_state_page.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key, required this.controller});

  final ContactController controller;

  @override
  State<ContactPage> createState() => _ContactPAgeState();
}

class _ContactPAgeState extends State<ContactPage> {
  ContactController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (controller.store.value is GenericStoreInitialState) {
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
          (context, value, child) => switch (value) {
            GenericStoreInitialState() => const GenericLoadingStatePage(),
            GenericStoreSuccessState(dataObject: final contact) =>
              ContactSuccessStatePage(
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
