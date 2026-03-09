import 'package:error_handler_with_result/error_handler_with_result.dart';

import '../../domain/dto/entities/resume_contact_entity.dart';
import '../../domain/dto/entities/resume_experience_entity.dart';
import '../../domain/dto/entities/resume_overview_entity.dart';
import '../../domain/repositories/resume_information_repository.dart';
import '../datasource/resume_information_datasource.dart';

class ResumeInformationRepositoryImpl implements ResumeInformationRepository {
  final ResumeInformationDatasource dataSource;

  const ResumeInformationRepositoryImpl(this.dataSource);

  @override
  Future<Result<ResumeContactEntity>> getResumeContact() async {
    try {
      final response = await dataSource.getResumeContact();

      return Result.success(
        response,
      );
    } catch (e, s) {
      return Result.failureFromCatch(e, s);
    }
  }

  @override
  Future<Result<ResumeExperienceEntity>> getResumeExperiences() async {
    try {
      final response = await dataSource.getResumeExperiences();

      return Result.success(
        response,
      );
    } catch (e, s) {
      return Result.failureFromCatch(e, s);
    }
  }

  @override
  Future<Result<ResumeOverviewEntity>> getResumeOverview() async {
    try {
      final response = await dataSource.getResumeOverview();

      return Result.success(
        response,
      );
    } catch (e, s) {
      return Result.failureFromCatch(e, s);
    }
  }
}
