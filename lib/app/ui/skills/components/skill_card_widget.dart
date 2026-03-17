import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../app/components/responsive_builder.dart';
import '../../app/extensions/context_extensions.dart';

class SkillCardWidget extends StatelessWidget {
  const SkillCardWidget({
    super.key,
    required this.name,
    required this.icon,
  });

  final String name;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      wide: (context) {
        const size = 16 * 4.0;

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(
              size * .33,
            ),
            child: Column(
              children: [
                Image.asset(
                  DsAssetsIcons.path() + icon,
                  width: size,
                  height: size,
                  color: context.colorScheme.primary,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  name,
                  style: context.textTheme.titleSmall?.copyWith(),
                ),
              ],
            ),
          ),
        );
      },
      desktop: (context) {
        const size = 16 * 4.0;

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(
              size * .33,
            ),
            child: Column(
              children: [
                Image.asset(
                  DsAssetsIcons.path() + icon,
                  width: size,
                  height: size,
                  color: context.colorScheme.primary,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  name,
                  style: context.textTheme.titleSmall?.copyWith(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
