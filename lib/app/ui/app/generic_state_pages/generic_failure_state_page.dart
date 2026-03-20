import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';

class GenericFailureStatePage extends StatelessWidget {
  const GenericFailureStatePage({
    super.key,
    required this.onTryAgain,
  });

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SelectableText(
              context.l10n.an_error_occurred_please_try_again_later,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onTryAgain,
              child: Text(context.l10n.try_again),
            ),
          ],
        ),
      ),
    );
  }
}
