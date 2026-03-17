import 'dart:convert';

import '../../domain/dto/entities/resume_about_site_entity.dart';
import '../../domain/dto/entities/resume_contact_entity.dart';
import '../../domain/dto/entities/resume_experience_entity.dart';
import '../../domain/dto/entities/resume_overview_entity.dart';
import '../../domain/dto/entities/resume_skills_entity.dart';
import 'resume_information_datasource.dart';

class ResumeInformationDatasourceDebug implements ResumeInformationDatasource {
  const ResumeInformationDatasourceDebug(this.datasource);

  final ResumeInformationDatasource datasource;

  @override
  Future<ResumeContactEntity> getResumeContact() async {
    return datasource.getResumeContact();
  }

  @override
  Future<ResumeExperienceEntity> getResumeExperiences() async {
    return datasource.getResumeExperiences();
  }

  @override
  Future<ResumeOverviewEntity> getResumeOverview() async {
    return datasource.getResumeOverview();
  }

  @override
  Future<ResumeSkillsEntity> getResumeSkills() async {
    return datasource.getResumeSkills();
  }

  @override
  Future<ResumeAboutSiteEntity> getResumeAboutSite() {
    return datasource.getResumeAboutSite();
  }
}
