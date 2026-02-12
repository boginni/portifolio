import 'package:custom_go_router/custom_go_router.dart';
import 'package:flutter/material.dart';
import '../splash/splash_route.dart';
import 'controller/shell_controller.dart';
import 'controller/shell_store.dart';
import 'pages/shell_error_state_page.dart';
import 'pages/shell_success_state_page.dart';

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
    return ValueListenableBuilder(
      valueListenable: widget.controller.store,
      builder: (context, value, child) {
        return switch (value) {
          ShellLoadingState() => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          ShellSuccessState() => ShellSuccessStatePage(
            controller: widget.controller,
          ),
          ShellErrorState() => ShellErrorStatePage(
            onRetry: init,
            onLogout: () {},
          ),
        };
      },
    );
  }
}
