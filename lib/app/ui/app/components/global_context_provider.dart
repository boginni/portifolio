import 'package:flutter/material.dart';

abstract final class GlobalContextProvider {
  static BuildContext? _context;

  static BuildContext get context {
    if (_context == null) {
      throw Exception('Global context is not initialized');
    }

    return _context!;
  }

  static set context(BuildContext context) {
    _context = context;
  }
}

class GlobalContextProviderWidget extends StatelessWidget {
  const GlobalContextProviderWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    GlobalContextProvider.context = context;

    return child;
  }
}
