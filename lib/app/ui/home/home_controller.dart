import 'package:flutter_purple_domains/flutter_purple_domains.dart';

import '../../domain/repositories/resume_information_repository.dart';
import 'home_store.dart';

class HomeController {
  final HomeStore store;

  final ResumeInformationRepository resumeOverviewRepository;
  final LauncherRepository launcherRepository;

  const HomeController(
    this.resumeOverviewRepository,
    this.launcherRepository, {
    required this.store,
  });

  Future<void> loadResume() async {
    store.state = HomeStoreState.loading();

    final result = await resumeOverviewRepository.getResumeOverview();

    if (result.isFailure) {
      store.state = HomeStoreState.failure();
      result.failure.throwError();
    }

    final state = HomeStoreState.success(
      overview: result.success,
    );

    store.state = state;
  }

  void launchUrl(String value) {
    launcherRepository.openBrowser(value);
  }
}
