import 'package:flutter/material.dart';
import '../../../../../domain/dto/entities/resume_about_site_entity.dart';
import '../../../components/feature_tile_widget.dart';
import '../../../components/footer_component.dart';

class AboutSitePageDesktopSuccessState extends StatelessWidget {
  const AboutSitePageDesktopSuccessState(
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
                SelectableText(
                  entity.title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                SelectableText(
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
          child: FooterComponent(
            entity: entity,
            onTapRepository: onTapRepository,
          ),
        ),
      ],
    );
  }
}
