

import 'package:flutter/material.dart';

import '../../../controller/shell_controller.dart';
import '../../../controller/shell_store.dart';
import '../../shell_error_state_page.dart';
import 'shell_page_desktop_success_state.dart';

class ShellPageDesktop extends StatelessWidget {
  const ShellPageDesktop({super.key, required this.controller});

  final ShellController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.store,
      builder: (context, value, child) {
        return switch (value) {
          ShellLoadingState() => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          ShellSuccessState() => ShellPageDesktopSuccessState(
            controller: controller,
          ),
          ShellErrorState() => const ShellPageErrorState(),
        };
      },
    );
  }
}
