import 'package:error_handler_with_result/error_handler_with_result.dart';

import '../dto/entities/resume_about_site_entity.dart';
import '../dto/entities/resume_contact_entity.dart';
import '../dto/entities/resume_experience_entity.dart';
import '../dto/entities/resume_overview_entity.dart';
import '../dto/entities/resume_skills_entity.dart';

abstract class ResumeInformationRepository {
  Future<Result<ResumeContactEntity>> getResumeContact();

  Future<Result<ResumeExperienceEntity>> getResumeExperiences();

  Future<Result<ResumeOverviewEntity>> getResumeOverview();

  Future<Result<ResumeSkillsEntity>> getResumeSkills();

  Future<Result<ResumeAboutSiteEntity>> getResumeAboutSite();
}
