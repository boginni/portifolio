import 'package:error_handler_with_result/error_handler_with_result.dart';

abstract class FailureMessageExtractionService {
  String? extractMessage(Failure failure);

  String getErrorMessage(Failure failure);
}
