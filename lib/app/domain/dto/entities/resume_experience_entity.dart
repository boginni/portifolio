import 'kpi_entity.dart';
import 'resume_experience_company_entity.dart';

class ResumeExperienceEntity {
  final String overview;
  final List<ResumeExperienceCompanyEntity> experienceCompanyList;
  final List<KpiEntity> kpis;

  const ResumeExperienceEntity({
    required this.overview,
    required this.experienceCompanyList,
    required this.kpis,
  });

  factory ResumeExperienceEntity.fromJson(Map<String, dynamic> json) {
    final experienceCompanyList =
        (json['experiences'] as List<dynamic>)
            .map((item) => ResumeExperienceCompanyEntity.fromJson(item))
            .toList();

    final kpis =
        (json['kpis'] as List<dynamic>)
            .map((item) => KpiEntity.fromJson(item))
            .toList();

    return ResumeExperienceEntity(
      overview: json['overview'] ?? '',
      experienceCompanyList: experienceCompanyList,
      kpis: kpis,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'overview': overview,
      'experiences':
          experienceCompanyList.map((company) => company.toJson()).toList(),
      'kpis': kpis.map((kpi) => kpi.toJson()).toList(),
    };
  }
}
