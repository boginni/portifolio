import 'package:flutter/foundation.dart';

import '../../domain/dto/entities/resume_overview_entity.dart';

class HomeStore extends ChangeNotifier
    implements ValueListenable<HomeStoreState> {
  HomeStoreState _state = HomeStoreState.initial();

  HomeStoreState get state => _state;

  set state(HomeStoreState value) {
    _state = value;
    notifyListeners();
  }

  @override
  HomeStoreState get value => _state;
}

sealed class HomeStoreState {
  const HomeStoreState();

  factory HomeStoreState.initial() = HomeStoreInitialState;

  factory HomeStoreState.loading() = HomeStoreLoadingState;

  factory HomeStoreState.failure() = HomeStoreFailureState;

  factory HomeStoreState.success({
    required ResumeOverviewEntity overview,
  }) = HomeStoreSuccessState;
}

class HomeStoreInitialState extends HomeStoreState {
  const HomeStoreInitialState();
}

class HomeStoreLoadingState extends HomeStoreState {
  const HomeStoreLoadingState();
}

class HomeStoreFailureState extends HomeStoreState {
  const HomeStoreFailureState();
}

class HomeStoreSuccessState extends HomeStoreState {
  const HomeStoreSuccessState({
    required this.overview,
  });

  final ResumeOverviewEntity overview;
}
