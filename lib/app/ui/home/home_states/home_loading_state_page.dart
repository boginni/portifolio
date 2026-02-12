import 'package:flutter/material.dart';

class HomeLoadingStatePage extends StatelessWidget {
  const HomeLoadingStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
