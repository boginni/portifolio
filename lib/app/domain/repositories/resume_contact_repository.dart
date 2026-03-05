import 'package:error_handler_with_result/error_handler_with_result.dart';

import '../dto/entities/resume_contact_entity.dart';

abstract class ResumeContactRepository {
  Future<Result<ResumeContactEntity>> getResumeContact();
}
