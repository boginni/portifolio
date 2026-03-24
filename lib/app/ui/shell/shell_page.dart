import 'package:flutter/material.dart';
import '../app/components/responsive_builder.dart';
import '../app/generic_state_pages/unsupported_resolution_page.dart';
import 'components/development_warning_dialog.dart';
import 'controller/shell_controller.dart';
import 'controller/shell_store.dart';
import 'pages/sizes/desktop/shell_page_desktop.dart';
import 'pages/sizes/phone/shell_page_phone.dart';
import 'pages/sizes/ultra_wide/shell_page_ultra_wide.dart';
import 'pages/sizes/wide/shell_page_wide.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({
    required this.controller,
    super.key,
  });

  final ShellController controller;

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  ShellController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
        init();
      },
    );
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1));
    widget.controller.store.state = const ShellSuccessState();

    // if (mounted) {
    //   await showDialog(
    //     context: context,
    //     builder: (context) => const DevelopmentWarningDialog(),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder.required(
      phone: (context) => ShellPageMobile(controller: controller),
      tablet: (context) => ShellPageMobile(controller: controller),
      desktop: (context) => ShellPageDesktop(controller: controller),
      wide: (context) => ShellPageWide(controller: controller),
      ultraWide: (context) => ShellPageUltraWide(controller: controller),
      unsupported: (context) => const UnsupportedResolutionPage(),
    );
  }
}
