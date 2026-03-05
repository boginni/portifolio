import '../../domain/dto/entities/resume_experience_entity.dart';
import '../../domain/repositories/resume_experiences_repository.dart';
import 'experience_store.dart';

class ExperienceController {
  final ExperienceStore store;
  final ResumeExperiencesRepository experiencesRepository;

  const ExperienceController(
    this.experiencesRepository, {
    required this.store,
  });

  Future<void> load() async {
    store.state = ExperienceStoreState.loading();

    final result = await experiencesRepository.getResumeExperiences();

    if (result.isFailure) {
      store.state = ExperienceStoreState.failure();
      result.failure.throwError();
    }

    final List<ResumeExperienceEntity> experienceCompanyList = result.success;

    final state = ExperienceStoreState.success(
      experienceCompanyList: experienceCompanyList,
    );

    store.state = state;
  }
}
