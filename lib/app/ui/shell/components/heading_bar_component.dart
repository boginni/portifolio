import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../app/extensions/context_extensions.dart';

class HeadingBarComponent extends StatelessWidget {
  const HeadingBarComponent({
    super.key,
    required this.onContactMe,
    required this.onAboutMe,
    required this.onSkills,
  });

  final VoidCallback onContactMe;
  final VoidCallback onAboutMe;
  final VoidCallback onSkills;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16 * 2,
        vertical: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            DsAssetsIcons.bfPng,
            height: 16 * 2,
            color: context.colorScheme.primary,
          ),
          const Spacer(),
          const _NavItemWidget(
            'About me',
          ),
          const _NavItemWidget(
            'Skills',
          ),
          const _NavItemWidget('Portfolio'),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: onContactMe,
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.surface,
              foregroundColor: context.colorScheme.onSurface,
              shape: const StadiumBorder(),
            ),
            child: const Text('CONTACT ME'),
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
