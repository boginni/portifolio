import 'package:flutter/material.dart';
import '../../../../../domain/dto/entities/resume_about_site_entity.dart';
import '../../../components/feature_tile_widget.dart';

class AboutSitePagePhoneSuccessState extends StatelessWidget {
  const AboutSitePagePhoneSuccessState(
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

    return ListView(
      children: [
        const SizedBox(height: 16 * 4),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              SelectableText(
                entity.title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SelectableText(
                entity.description,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: .9,
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
        const SizedBox(height: 16 * 2),
      ],
    );
  }
}
