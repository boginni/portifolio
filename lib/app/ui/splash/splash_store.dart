import 'package:flutter/cupertino.dart';

class SplashStore extends ChangeNotifier {
  SplashStoreState _state = SplashStoreState.loading();

  SplashStoreState get state => _state;

  set state(SplashStoreState value) {
    _state = value;
    notifyListeners();
  }
}

sealed class SplashStoreState {
  const SplashStoreState();

  factory SplashStoreState.loading() = SplashStoreLoadingState;

  factory SplashStoreState.failToGetLocation() =
      SplashStoreFailToGetLocationState;
}

class SplashStoreLoadingState extends SplashStoreState {}

class SplashStorePermissionFailureState extends SplashStoreState {
  const SplashStorePermissionFailureState();
}

class SplashStorePermissionDeniedForeverState extends SplashStoreState {
  const SplashStorePermissionDeniedForeverState();
}

class SplashStoreFailToGetLocationState extends SplashStoreState {}
