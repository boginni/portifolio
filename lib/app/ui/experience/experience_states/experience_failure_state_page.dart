import 'package:flutter/material.dart';

class ExperienceFailureStatePage extends StatelessWidget {
  const ExperienceFailureStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
