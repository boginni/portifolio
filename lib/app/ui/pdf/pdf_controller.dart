import 'dart:typed_data';

import 'package:error_handler_with_result/error_handler_with_result.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../../domain/repositories/resume_information_repository.dart';
import '../app/store/generic_store.dart';
import 'pages/resume_pdf_service.dart';

class PdfController {
  final ResumeInformationRepository resumeInformationRepository;
  final ResumePdfService resumePdfService;
  final GenericStore<Uint8List> store;

  const PdfController(
    this.resumeInformationRepository,
    this.resumePdfService, {
    required this.store,
  });

  Future<void> generatePdf() async {
    store.state = GenericStoreState.loading();

    final resumeContact = await resumeInformationRepository.getResumeContact();
    final resumeOverview =
        await resumeInformationRepository.getResumeOverview();
    final resumeExperiences =
        await resumeInformationRepository.getResumeExperiences();
    final resumeSkills = await resumeInformationRepository.getResumeSkills();
    final resumeAboutSite =
        await resumeInformationRepository.getResumeAboutSite();

    final hasError =
        [
          resumeContact,
          resumeOverview,
          resumeExperiences,
          resumeSkills,
          resumeAboutSite,
        ].where((element) => element.isFailure).firstOrNull;

    if (hasError != null) {
      store.state = GenericStoreState.failure();
      hasError.failure.throwError();
    }

    try {
      final pdfBytes = await resumePdfService.generateResumePdf(
        overview: resumeOverview.success,
        contact: resumeContact.success,
        experience: resumeExperiences.success,
        skills: resumeSkills.success,
      );

      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdfBytes,
      );

      store.state = GenericStoreState.initial();
    } catch (e, s) {
      store.state = GenericStoreState.failure();
      Result.failureFromCatch(e, s).failure.throwError();
    }
  }
}
