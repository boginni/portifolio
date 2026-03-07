import 'package:flutter/material.dart';
import '../app/components/responsive_builder.dart';
import '../app/store/generic_store.dart';
import 'contact_controller.dart';
import 'contact_states/sizes/phone/contact_page_phone.dart';
import 'contact_states/sizes/wide/contact_page_wide.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({
    super.key,
    required this.controller,
    this.forceDisplaySize,
  });

  final ContactController controller;
  final ResponsiveDisplaySizeEnum? forceDisplaySize;

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
    return ResponsiveBuilder(
      forceDisplaySize: widget.forceDisplaySize,
      phone: (context) => ContactPagePhone(controller: controller, init: init),
      wide: (context) => ContactPageWide(controller: controller, init: init),
    );
  }
}
