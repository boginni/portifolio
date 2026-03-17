import 'package:flutter/material.dart';

import '../../../controller/shell_controller.dart';
import '../../../controller/shell_store.dart';
import '../../shell_error_state_page.dart';
import 'shell_page_phone_success_state.dart';

class ShellPageMobile extends StatelessWidget {
  const ShellPageMobile({
    super.key,
    required this.controller,
  });

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
          ShellSuccessState() => ShellPagePhoneSuccessState(
            controller: controller,
          ),
          ShellErrorState() => const ShellPageErrorState(),
        };
      },
    );
  }
}
