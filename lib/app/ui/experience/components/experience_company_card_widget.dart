import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../domain/dto/entities/resume_experience_company_entity.dart';

class ExperienceCompanyCardWidget extends StatelessWidget {
  const ExperienceCompanyCardWidget({
    super.key,
    required this.experience,
    this.onTap,
  });

  final ResumeExperienceCompanyEntity experience;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      shape: ContinuousRectangleBorder(
        side: BorderSide(color: colorScheme.outline),
        borderRadius: BorderRadius.circular(
          16 * 3,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        hoverColor: colorScheme.surfaceContainerHighest,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 16 * 5,
                    height: 16 * 5,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        DsAssetsResources.path() + experience.icon,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, _, _) => Icon(
                              Icons.business_rounded,
                              color: colorScheme.primary,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          experience.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.work_outline_rounded,
                              size: 16,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              experience.subtitle,
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${experience.startDate} — ${experience.endDate}'
                              .toUpperCase(),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.secondary,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              Text(
                experience.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
