import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../domain/dto/entities/resume_skills_entity.dart';

class SkillsPageUltraWideSuccessState extends StatelessWidget {
  const SkillsPageUltraWideSuccessState({
    super.key,
    required this.entity,
  });

  final ResumeSkillsEntity entity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 1080,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16 * 2,
          ),
          child: Column(
            children: [
              const Divider(),
              const SizedBox(
                height: 16 * 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Professional',
                          style: textTheme.headlineMedium?.copyWith(),
                        ),
                        Text(
                          'Background Skills and\nAccomplishments',
                          style: textTheme.headlineSmall?.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16 * 3),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children:
              entity.technologies.map(
                (e) {
                  const size = 16 * 6.0;

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        size * .33,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            DsAssetsIcons.path() + e.icon,
                            width: size,
                            height: size,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            e.name,
                            style: textTheme.titleLarge?.copyWith(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
        ),
      ],
    );
  }
}
