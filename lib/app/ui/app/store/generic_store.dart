import 'package:flutter/foundation.dart';

class GenericStore<T> extends ChangeNotifier
    implements ValueListenable<GenericStoreState> {
  GenericStoreState _state = GenericStoreState.initial();

  GenericStoreState get state => _state;

  set state(GenericStoreState value) {
    _state = value;
    notifyListeners();
  }

  @override
  GenericStoreState get value => _state;
}

sealed class GenericStoreState<T> {
  const GenericStoreState();

  factory GenericStoreState.initial() = GenericStoreInitialState<T>;

  factory GenericStoreState.loading() = GenericStoreLoadingState<T>;

  factory GenericStoreState.failure() = GenericStoreFailureState<T>;

  factory GenericStoreState.success({
    required T dataObject,
  }) = GenericStoreSuccessState<T>;
}

class GenericStoreInitialState<T> extends GenericStoreState<T> {
  const GenericStoreInitialState();
}

class GenericStoreLoadingState<T> extends GenericStoreState<T> {
  const GenericStoreLoadingState();
}

class GenericStoreFailureState<T> extends GenericStoreState<T> {
  const GenericStoreFailureState();
}

class GenericStoreSuccessState<T> extends GenericStoreState<T> {
  const GenericStoreSuccessState({required this.dataObject});

  final T dataObject;
}
