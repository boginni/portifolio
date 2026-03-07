import 'package:flutter/material.dart';

import '../../../../app/extensions/context_extensions.dart';
import '../../../../home/pages/home_page.dart';
import '../../../controller/shell_controller.dart';

class ShellPageDesktop extends StatelessWidget {
  const ShellPageDesktop({super.key, required this.controller});

  final ShellController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              child: Row(
                children: [
                  // Logo Placeholder
                  Text(
                    'TG',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const _NavItemWidget(
                    'About me',
                  ),
                  const _NavItemWidget(
                    'Skills',
                  ),
                  const _NavItemWidget('Portfolio'),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colorScheme.surface,
                      foregroundColor: context.colorScheme.onSurface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('CONTACT ME'),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: HomePage(controller: controller.homeController),
          ),
        ],
      ),
    );
  }
}

class _NavItemWidget extends StatelessWidget {
  const _NavItemWidget(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        label,
        style: context.textTheme.labelLarge,
      ),
    );
  }
}
