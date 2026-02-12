import 'package:flutter/foundation.dart';

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
    required String title,
    required String subtitle,
    required String description,
    required String linkedinUrl,
    required String githubUrl,
    required String cvUrl,
    required String photo,
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
    required this.title,
    required this.subtitle,
    required this.description,
    required this.linkedinUrl,
    required this.githubUrl,
    required this.cvUrl,
    required this.photo,
  });

  final String title;
  final String subtitle;
  final String description;
  final String linkedinUrl;
  final String githubUrl;
  final String cvUrl;
  final String photo;
}
