import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:error_handler_with_result/error_handler_with_result.dart';

import '../../domain/dto/entities/resume_experience_entity.dart';
import '../../domain/repositories/resume_experiences_repository.dart';

class ResumeExperiencesRepositoryImpl implements ResumeExperiencesRepository {
  @override
  Future<Result<List<ResumeExperienceEntity>>> getResumeExperiences() async {
    final dio = Dio();

    try {
      final response = await dio.get(
        'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/experience.json',
      );

      if (response.statusCode == 200) {
        final data = response.data;

        final jsonData = jsonDecode(data);

        final experiences = jsonData['experiences'] as List<dynamic>;

        return Result.success(
          experiences
              .map((item) => ResumeExperienceEntity.fromJson(item))
              .toList(),
        );
      } else {
        return Result.failure(
          UnknownFailure(
            'Failed to fetch resume overview: ${response.statusCode}',
            StackTrace.current,
          ),
        );
      }
    } catch (e, s) {
      return Result.failure(
        UnknownFailure(e, s),
      );
    }
  }
}
