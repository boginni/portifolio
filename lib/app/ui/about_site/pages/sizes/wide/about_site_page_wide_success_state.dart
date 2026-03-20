import 'package:flutter/material.dart';
import '../../../../../domain/dto/entities/resume_about_site_entity.dart';
import '../../../components/feature_tile_widget.dart';
import '../../../components/footer_component.dart';

class AboutSitePageWideSuccessState extends StatelessWidget {
  const AboutSitePageWideSuccessState(
    this.entity, {
    super.key,
    required this.onRefresh,
        required this.onTapRepository,
      });

  final ResumeAboutSiteEntity entity;
  final RefreshCallback onRefresh;
  final VoidCallback onTapRepository;

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
              ),
              const SizedBox(height: 16 * 3),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 16 * 2,
                crossAxisSpacing: 16 * 2,
                childAspectRatio: 1.5,
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
        const SizedBox(height: 16 * 4),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16 * 2,
            vertical: 16,
          ),
          child: FooterComponent(
            entity: entity,
            onTapRepository: onTapRepository,
          ),
        ),
      ],
    );
  }
}
