import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:error_handler_with_result/error_handler_with_result.dart';

import '../../domain/dto/entities/resume_overview_entity.dart';
import '../../domain/repositories/resume_overview_repository.dart';

class ResumeOverviewRepositoryImpl implements ResumeOverviewRepository {
  @override
  Future<Result<ResumeOverviewEntity>> getResumeOverview() async {
    final dio = Dio();

    try {
      final response = await dio.get(
        'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/overview.json',
      );

      if (response.statusCode == 200) {
        final data = response.data;

        final jsonData = jsonDecode(data);

        return Result.success(
          ResumeOverviewEntity.fromJson(jsonData),
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
