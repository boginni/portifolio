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

    if (mounted) {
      await showDialog(
        context: context,
        builder: (context) => const DevelopmentWarningDialog(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      phone: (context) => ShellMobilePage(controller: controller),
      desktop: (context) => ShellDesktopPage(controller: controller),
    );
  }
}

class DevelopmentWarningDialog extends StatelessWidget {
  const DevelopmentWarningDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Under Development',
        textAlign: TextAlign.center,
      ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'This portfolio is currently under development',
          ),
          Text(
            'Please check back later!',
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            WidgetsBinding.instance.addPostFrameCallback(
              (timeStamp) {
                if (context.mounted) {
                  showDialog(
                    context: context,
                    builder: (context) => const DevelopmentWarningDialog(),
                  );
                }
              },
            );
          },
          child: const Text('Not ok'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
