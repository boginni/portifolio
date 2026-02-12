import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShellStore extends ChangeNotifier implements ValueListenable<ShellState> {
  ShellStore();

  ShellState _state = const ShellLoadingState();

  ShellState get state => _state;

  late final PageController pageController = PageController();

  int get pageSelected =>
      pageController.hasClients ? (pageController.page?.toInt() ?? 0) : 0;

  set state(ShellState newState) {
    if (_state == newState) {
      return;
    }

    _state = newState;
    notifyListeners();
  }

  @override
  ShellState get value => _state;
}

sealed class ShellState {
  const ShellState();
}

class ShellLoadingState extends ShellState {
  const ShellLoadingState();
}

class ShellSuccessState extends ShellState {
  const ShellSuccessState();
}

class ShellErrorState extends ShellState {
  const ShellErrorState();
}
