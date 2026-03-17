import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:error_handler_with_result/error_handler_with_result.dart';

import '../../domain/dto/entities/resume_about_site_entity.dart';
import '../../domain/dto/entities/resume_contact_entity.dart';
import '../../domain/dto/entities/resume_experience_entity.dart';
import '../../domain/dto/entities/resume_overview_entity.dart';
import '../../domain/dto/entities/resume_skills_entity.dart';
import 'preferences_datasource.dart';

abstract class ResumeInformationDatasource {
  Future<ResumeContactEntity> getResumeContact();

  Future<ResumeExperienceEntity> getResumeExperiences();

  Future<ResumeOverviewEntity> getResumeOverview();

  Future<ResumeSkillsEntity> getResumeSkills();

  Future<ResumeAboutSiteEntity> getResumeAboutSite();
}

class ResumeInformationDatasourceImpl implements ResumeInformationDatasource {
  const ResumeInformationDatasourceImpl(
    this.dio,
    this.storage,
  );

  final Dio dio;
  final PreferencesDatasource storage;

  Future<String> getLanguageSuffix() async {
    try {
      final preferences = await storage.get();

      final languageSuffix = preferences.locale.languageCode;

      if (languageSuffix.isNotEmpty) {
        return languageSuffix;
      }

      return 'en';
    } catch (e) {
      return 'en';
    }
  }

  @override
  Future<ResumeContactEntity> getResumeContact() async {
    final languageSuffix = await getLanguageSuffix();

    final response = await dio.get(
      'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/resume_data/$languageSuffix/contact.json',
    );

    if (response.statusCode == 200) {
      final data = response.data;

      final jsonData = jsonDecode(data);

      return ResumeContactEntity.fromJson(jsonData);
    }

    throw UnknownFailure(
      'Failed to fetch resume Contact: ${response.statusCode}',
      StackTrace.current,
    );
  }

  @override
  Future<ResumeExperienceEntity> getResumeExperiences() async {
    final languageSuffix = await getLanguageSuffix();

    final response = await dio.get(
      'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/resume_data/$languageSuffix/experience.json',
    );

    if (response.statusCode == 200) {
      final data = response.data;

      final jsonData = jsonDecode(data);

      return ResumeExperienceEntity.fromJson(jsonData);
    }

    throw UnknownFailure(
      'Failed to fetch resume overview: ${response.statusCode}',
      StackTrace.current,
    );
  }

  @override
  Future<ResumeOverviewEntity> getResumeOverview() async {
    final languageSuffix = await getLanguageSuffix();

    final response = await dio.get(
      'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/resume_data/$languageSuffix/overview.json',
    );

    if (response.statusCode == 200) {
      final data = response.data;

      final jsonData = jsonDecode(data);

      return ResumeOverviewEntity.fromJson(jsonData);
    }

    throw UnknownFailure(
      'Failed to fetch resume overview: ${response.statusCode}',
      StackTrace.current,
    );
  }

  @override
  Future<ResumeSkillsEntity> getResumeSkills() async {
    final languageSuffix = await getLanguageSuffix();

    final response = await dio.get(
      'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/resume_data/$languageSuffix/skills.json',
    );

    if (response.statusCode == 200) {
      final data = response.data;

      final jsonData = jsonDecode(data);

      return ResumeSkillsEntity.fromJson(jsonData);
    }

    throw UnknownFailure(
      'Failed to fetch resume overview: ${response.statusCode}',
      StackTrace.current,
    );
  }

  @override
  Future<ResumeAboutSiteEntity> getResumeAboutSite() async {
    final languageSuffix = await getLanguageSuffix();

    final response = await dio.get(
      'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/resume_data/$languageSuffix/about_site.json',
    );

    if (response.statusCode == 200) {
      final data = response.data;

      final jsonData = jsonDecode(data);

      return ResumeAboutSiteEntity.fromJson(jsonData);
    }

    throw UnknownFailure(
      'Failed to fetch resume overview: ${response.statusCode}',
      StackTrace.current,
    );
  }
}
