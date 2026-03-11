import '../../../domain/dto/entities/resume_skills_entity.dart';
import '../../../domain/repositories/resume_information_repository.dart';
import '../../app/store/generic_store.dart';

class SkillsController {
  final GenericStore<ResumeSkillsEntity> store;

  final ResumeInformationRepository resumeInformationRepository;

  const SkillsController(
    this.resumeInformationRepository, {
    required this.store,
  });

  Future<void> load() async {
    store.state = GenericStoreState.loading();

    final result = await resumeInformationRepository.getResumeSkills();

    if (result.isFailure) {
      store.state = GenericStoreState.failure();
      result.failure.throwError();
    }

    final state = GenericStoreState.success(
      dataObject: result.success,
    );

    store.state = state;
  }
}
