

import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_skills_entity.dart';
import '../../../../app/components/inverse_brightness_builder.dart';
import '../../../../app/components/waka_time_grid_widget.dart';
import '../../../components/skill_card_widget.dart';

class SkillsPageDesktopSuccessState extends StatelessWidget {
  const SkillsPageDesktopSuccessState({
    super.key,
    required this.entity,
  });

  final ResumeSkillsEntity entity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Divider(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16 * 2,
          ),
          child: Column(
            children: [
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
                          style: textTheme.headlineSmall?.copyWith(),
                        ),
                        Text(
                          'Background Skills and\nAccomplishments',
                          style: textTheme.titleMedium?.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16 * 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children:
                entity.technologies
                    .map(
                      (e) => SkillCardWidget(
                        name: e.name,
                        icon: e.icon,
                      ),
                    )
                    .toList(),
          ),
        ),
        const SizedBox(height: 16 * 2),
        InverseBrightnessBuilder(
          builder: (context, _) {
            return const WakaTimeGridWidget();
          },
        ),
      ],
    );
  }
}
