import 'package:flutter/material.dart';

class HomeFailureStatePage extends StatelessWidget {
  const HomeFailureStatePage({
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'An error occurred while loading your resume. Please try again later.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            FilledButton(
              onPressed: onTryAgain,
              child: Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
