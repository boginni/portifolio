import 'package:flutter/material.dart';
import '../../../../../domain/dto/entities/resume_about_site_entity.dart';
import '../../../components/feature_tile_widget.dart';

class AboutSitePageDesktopSuccessState extends StatelessWidget {
  const AboutSitePageDesktopSuccessState(
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
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 16 * 2,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16 * 4,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  entity.title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  entity.description,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Wrap(
                  runSpacing: 16,
                  spacing: 16,
                  alignment: WrapAlignment.center,
                  children:
                      entity.features
                          .map(
                            (e) => SizedBox(
                              width: 16 * 10 * 2,
                              height: 16 * 10,
                              child: FeatureTileWidget(
                                icon: IconData(
                                  int.parse(e.icon),
                                  fontFamily: 'MaterialIcons',
                                ),
                                title: e.title,
                                desc: e.description,
                              ),
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16 * 2,
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16 * 2,
            vertical: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
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
                        style: theme.textTheme.bodyMedium?.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
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
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                '© 2026 — Vila Velha, Brazil',
                style: theme.textTheme.labelSmall?.copyWith(
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
