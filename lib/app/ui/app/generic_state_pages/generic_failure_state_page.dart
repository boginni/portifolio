import 'package:flutter/material.dart';

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
            const Text(
              'An error occurred. Please try again later.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onTryAgain,
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
