import '../../domain/dto/entities/resume_experience_company_entity.dart';
import '../../domain/repositories/resume_information_repository.dart';
import 'experience_store.dart';

class ExperienceController {
  final ExperienceStore store;
  final ResumeInformationRepository experiencesRepository;

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

    final experienceCompanyList = result.success;

    final state = ExperienceStoreState.success(
      experienceObject: experienceCompanyList,
    );

    store.state = state;
  }
}
