import 'package:flutter/material.dart';

import '../pdf_controller.dart';

class PdfDownloadComponent extends StatefulWidget {
  const PdfDownloadComponent(
    this.controller, {
    super.key,
  });

  final PdfController controller;

  @override
  State<PdfDownloadComponent> createState() => _PdfDownloadComponentState();
}

class _PdfDownloadComponentState extends State<PdfDownloadComponent> {
  PdfController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return const Offstage();

    // return ValueListenableBuilder(
    //   valueListenable: controller.store,
    //   builder: (context, value, child) {
    //     return switch (value) {
    //       GenericStoreInitialState() => FilledButton(
    //         onPressed: controller.generatePdf,
    //         child: const SelectableText('Download CV'),
    //       ),
    //       GenericStoreLoadingState() => const Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //       GenericStoreFailureState() => FilledButton(
    //         onPressed: controller.generatePdf,
    //         child: const SelectableText('Try Again'),
    //       ),
    //       GenericStoreSuccessState() => FilledButton(
    //         onPressed: controller.generatePdf,
    //         child: const SelectableText('Download Again'),
    //       ),
    //     };
    //   },
    // );
  }
}
