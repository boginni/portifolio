import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../domain/dto/entities/resume_contact_entity.dart';
import '../../../domain/dto/entities/resume_experience_entity.dart';
import '../../../domain/dto/entities/resume_overview_entity.dart';
import '../../../domain/dto/entities/resume_skills_entity.dart';

class ResumePdfService {
  Future<Uint8List> generateResumePdf({
    required ResumeOverviewEntity overview,
    required ResumeContactEntity contact,
    required ResumeExperienceEntity experience,
    required ResumeSkillsEntity skills,
  }) async {
    final pdf = pw.Document();

    // Use a multi-page layout for flexibility
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build:
            (pw.Context context) => [
              _buildHeader(overview, contact),
              pw.SizedBox(height: 20),
              _buildSummary(overview.professionalSummary),
              pw.Divider(),
              _buildExperienceSection(experience),
              pw.SizedBox(height: 20),
              _buildSkillsSection(skills),
            ],
      ),
    );

    return pdf.save();
  }

  /// 1. Header with Name and Contact Info
  pw.Widget _buildHeader(
    ResumeOverviewEntity overview,
    ResumeContactEntity contact,
  ) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              overview.name,
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.Text(
              overview.title,
              style: const pw.TextStyle(fontSize: 16, color: PdfColors.grey700),
            ),
          ],
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text(
              contact.email,
              style: const pw.TextStyle(fontSize: 10),
            ),
            pw.Text(contact.whatsapp, style: const pw.TextStyle(fontSize: 10)),
            pw.Text(contact.location, style: const pw.TextStyle(fontSize: 10)),
          ],
        ),
      ],
    );
  }

  /// 2. Professional Summary
  pw.Widget _buildSummary(String summary) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Professional Summary',
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 8),
        pw.Text(summary, textAlign: pw.TextAlign.justify),
      ],
    );
  }

  /// 3. Experience List
  pw.Widget _buildExperienceSection(ResumeExperienceEntity experience) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Experience',
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 10),
        ...experience.experienceCompanyList.map(
          (exp) => pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 12),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      exp.title,
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      '${exp.startDate} - ${exp.endDate}',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                pw.Text(
                  exp.subtitle,
                  style: pw.TextStyle(fontStyle: pw.FontStyle.italic),
                ),
                pw.Bullet(text: exp.description),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 4. Skills Grid
  pw.Widget _buildSkillsSection(ResumeSkillsEntity skills) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          skills.title,
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 8),
        pw.Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
              skills.technologies
                  .map(
                    (tech) => pw.Container(
                      padding: const pw.EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(color: PdfColors.grey),
                        borderRadius: const pw.BorderRadius.all(
                          pw.Radius.circular(4),
                        ),
                      ),
                      child: pw.Text(
                        tech.name,
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
