import 'package:flutter/material.dart';

import '../../app/components/responsive_builder.dart';
import '../controller/shell_controller.dart';
import 'sizes/mobile/shell_success_state_page_mobile.dart';

class ShellSuccessStatePage extends StatelessWidget {
  const ShellSuccessStatePage({
    required this.controller,
    super.key,
  });

  final ShellController controller;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      phone: (context) => ShellSuccessStatePageMobile(controller: controller),
    );
  }
}
