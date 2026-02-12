import 'package:flutter/foundation.dart';

import '../../domain/dto/entities/experience_company_entity.dart';

class ExperienceStore extends ChangeNotifier
    implements ValueListenable<ExperienceStoreState> {
  ExperienceStoreState _state = ExperienceStoreState.initial();

  ExperienceStoreState get state => _state;

  set state(ExperienceStoreState value) {
    _state = value;
    notifyListeners();
  }

  @override
  ExperienceStoreState get value => _state;
}

sealed class ExperienceStoreState {
  const ExperienceStoreState();

  factory ExperienceStoreState.initial() = ExperienceStoreInitialState;

  factory ExperienceStoreState.loading() = ExperienceStoreLoadingState;

  factory ExperienceStoreState.failure() = ExperienceStoreFailureState;

  factory ExperienceStoreState.success({
    required List<ExperienceCompanyEntity> experienceCompanyList,
  }) = ExperienceStoreSuccessState;
}

class ExperienceStoreInitialState extends ExperienceStoreState {
  const ExperienceStoreInitialState();
}

class ExperienceStoreLoadingState extends ExperienceStoreState {
  const ExperienceStoreLoadingState();
}

class ExperienceStoreFailureState extends ExperienceStoreState {
  const ExperienceStoreFailureState();
}

class ExperienceStoreSuccessState extends ExperienceStoreState {
  const ExperienceStoreSuccessState({required this.experienceCompanyList});

  final List<ExperienceCompanyEntity> experienceCompanyList;
}
