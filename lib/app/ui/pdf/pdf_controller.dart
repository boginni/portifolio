// ignore_for_file: unused_import

import 'dart:isolate';
import 'dart:typed_data';

import 'package:error_handler_with_result/error_handler_with_result.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

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
