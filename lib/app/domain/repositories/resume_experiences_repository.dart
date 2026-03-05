import 'package:error_handler_with_result/error_handler_with_result.dart';

import '../dto/entities/resume_experience_entity.dart';

abstract class ResumeExperiencesRepository {
  Future<Result<List<ResumeExperienceEntity>>> getResumeExperiences();
}
