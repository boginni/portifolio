import 'package:flutter/material.dart';

import '../../app/store/generic_store.dart';
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
    return ValueListenableBuilder(
      valueListenable: controller.store,
      builder: (context, value, child) {
        return switch (value) {
          GenericStoreInitialState() => FilledButton(
            onPressed: controller.generatePdf,
            child: const Text('Download CV'),
          ),
          GenericStoreLoadingState() => const CircularProgressIndicator(),
          GenericStoreFailureState() => FilledButton(
            onPressed: controller.generatePdf,
            child: const Text('Try Again'),
          ),
          GenericStoreSuccessState() => FilledButton(
            onPressed: controller.generatePdf,
            child: const Text('Download Again'),
          ),
        };
      },
    );
  }
}
