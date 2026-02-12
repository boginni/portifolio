import 'package:flutter/material.dart';

import '../../app/components/svg_icon.dart';
import '../../app/extensions/context_extensions.dart';

class SocialCardWidget extends StatelessWidget {
  const SocialCardWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: context.colorScheme.surfaceContainerHighest,
      child: SizedBox(
        height: 120,
        width: 120,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SvgIcon(
                  icon,
                  size: 48,
                ),
              ),
              Text(
                title,
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
