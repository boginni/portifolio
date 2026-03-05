import 'package:ds_assets/ds_assets.dart';

import '../../domain/repositories/resume_overview_repository.dart';
import 'home_store.dart';

class HomeController {
  final HomeStore store;

  final ResumeOverviewRepository resumeOverviewRepository;

  const HomeController(
    this.resumeOverviewRepository, {
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
}
