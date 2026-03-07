import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';

class GenericLoadingStatePage extends StatelessWidget {
  const GenericLoadingStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surface,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
