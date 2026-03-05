import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:error_handler_with_result/error_handler_with_result.dart';

import '../../domain/dto/entities/resume_contact_entity.dart';
import '../../domain/repositories/resume_contact_repository.dart';

class ResumeContactRepositoryImpl implements ResumeContactRepository {
  @override
  Future<Result<ResumeContactEntity>> getResumeContact() async {
    final dio = Dio();

    try {
      final response = await dio.get(
        'https://raw.githubusercontent.com/boginni/portifolio/refs/heads/main/github_files/contact.json',
      );

      if (response.statusCode == 200) {
        final data = response.data;

        final jsonData = jsonDecode(data);

        return Result.success(
          ResumeContactEntity.fromJson(jsonData),
        );
      } else {
        return Result.failure(
          UnknownFailure(
            'Failed to fetch resume Contact: ${response.statusCode}',
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
