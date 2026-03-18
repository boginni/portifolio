

import 'dart:typed_data';

import '../../domain/repositories/resume_information_repository.dart';
import '../app/store/generic_store.dart';

class PdfController {
  final ResumeInformationRepository resumeInformationRepository;
  final GenericStore<Uint8List> store;

  const PdfController(
    this.resumeInformationRepository, {
    required this.store,
  });

  Future<void> generatePdf() async {
    store.state = GenericStoreState.loading();
  }
}
