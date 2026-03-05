import '../../domain/dto/entities/resume_contact_entity.dart';
import '../../domain/repositories/resume_contact_repository.dart';
import '../app/store/generic_store.dart';

class ContactController {
  final GenericStore<ResumeContactEntity> store;
  final ResumeContactRepository experiencesRepository;

  const ContactController(
    this.experiencesRepository, {
    required this.store,
  });

  Future<void> load() async {
    store.state = GenericStoreState.loading();

    final result = await experiencesRepository.getResumeContact();

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
