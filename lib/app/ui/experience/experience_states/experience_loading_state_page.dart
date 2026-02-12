import 'package:flutter/material.dart';

class ExperienceLoadingStatePage extends StatelessWidget {
  const ExperienceLoadingStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
