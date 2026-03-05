import 'package:flutter/material.dart';

class GenericLoadingStatePage extends StatelessWidget {
  const GenericLoadingStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
