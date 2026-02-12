import 'package:flutter/material.dart';

class HomeFailureStatePage extends StatelessWidget {
  const HomeFailureStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
