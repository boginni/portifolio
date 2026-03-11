import '../../domain/dto/entities/resume_about_site_entity.dart';
import '../../domain/repositories/resume_information_repository.dart';
import '../app/store/generic_store.dart';

class AboutSiteController {
  final ResumeInformationRepository resumeInformationRepository;
  final GenericStore<ResumeAboutSiteEntity> store;

  const AboutSiteController(
    this.resumeInformationRepository, {
    required this.store,
  });

  Future<void> load() async {
    store.state = GenericStoreState.loading();

    final result = await resumeInformationRepository.getResumeAboutSite();

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
