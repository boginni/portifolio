import 'package:flutter/material.dart';
import '../../../domain/dto/entities/resume_about_site_entity.dart';
import '../../app/components/inverse_brightness_builder.dart';
import '../components/feature_tile_widget.dart';

class AboutSitePageUltraWideSuccessState extends StatelessWidget {
  const AboutSitePageUltraWideSuccessState(
    this.entity, {
    super.key,
    required this.onRefresh,
  });

  final ResumeAboutSiteEntity entity;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16 * 4,
          ),
          child: Column(
            children: [
              Text(
                entity.title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                entity.description,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16 * 3),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 16 * 2,
                crossAxisSpacing: 16 * 2,
                childAspectRatio: 2.5,
                children:
                    entity.features
                        .map(
                          (e) => FeatureTileWidget(
                            icon: IconData(
                              int.parse(e.icon),
                              fontFamily: 'MaterialIcons',
                            ),
                            title: e.title,
                            desc: e.description,
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        ),
        const Spacer(),
        InverseBrightnessBuilder(
          builder: (_, _) => const Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16 * 2,
            vertical: 16,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Brunno França',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        'Built with Flutter • Hosted on GitHub Pages',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.code_rounded,
                            size: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                '© 2026 — Vila Velha, Brazil',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.outline,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
