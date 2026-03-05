import 'package:error_handler_with_result/error_handler_with_result.dart';

import '../dto/entities/resume_overview_entity.dart';

abstract class ResumeOverviewRepository {
  Future<Result<ResumeOverviewEntity>> getResumeOverview();
}
