import 'package:flutter/material.dart';
import '../app/components/responsive_builder.dart';
import 'controller/shell_controller.dart';
import 'controller/shell_store.dart';
import 'pages/sizes/desktop/shell_desktop_page.dart';
import 'pages/sizes/mobile/shell_mobile_page.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      phone: (context) => ShellMobilePage(controller: controller),
      desktop: (context) => ShellDesktopPage(controller: controller),
    );
  }
}
