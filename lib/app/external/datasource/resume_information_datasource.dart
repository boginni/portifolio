import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:error_handler_with_result/error_handler_with_result.dart';

import '../../domain/dto/entities/resume_contact_entity.dart';
import '../../domain/dto/entities/resume_experience_entity.dart';
import '../../domain/dto/entities/resume_overview_entity.dart';

abstract class ResumeInformationDatasource {
  Future<ResumeContactEntity> getResumeContact();

  Future<ResumeExperienceEntity> getResumeExperiences();

  Future<ResumeOverviewEntity> getResumeOverview();
}

class ResumeInformationDatasourceImpl implements ResumeInformationDatasource {
  const ResumeInformationDatasourceImpl(this.dio);

  final Dio dio;

  @override
  Future<ResumeContactEntity> getResumeContact() async {
    final response = await dio.get(
      'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/contact.json',
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
    final response = await dio.get(
      'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/experience.json',
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
    final response = await dio.get(
      'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/overview.json',
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
}
