import 'package:flutter/material.dart';
import '../../../../../domain/dto/entities/resume_about_site_entity.dart';
import '../../../../app/components/inverse_brightness_builder.dart';
import '../../../components/feature_tile_widget.dart';
import '../../../components/footer_component.dart';

class AboutSitePageUltraWideSuccessState extends StatelessWidget {
  const AboutSitePageUltraWideSuccessState(
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
        const SizedBox(height: 16 * 4),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16 * 4,
          ),
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 1080),
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
                  ],
                ),
              ),
              const SizedBox(height: 16 * 3),
              Wrap(
                runSpacing: 16,
                spacing: 16,
                alignment: WrapAlignment.center,
                children:
                    entity.features
                        .map(
                          (e) => SizedBox(
                            width: 16 * 12 * 2,
                            height: 16 * 16,
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
        const Spacer(),
        InverseBrightnessBuilder(
          builder: (_, _) => const Divider(),
        ),
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
