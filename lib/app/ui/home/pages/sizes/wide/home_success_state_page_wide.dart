import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_overview_entity.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../components/background_split.dart';
import '../../../components/high_resolution_image.dart';
import '../../../components/social_icon_widget.dart';

class HomeSuccessStatePageWide extends StatelessWidget {
  const HomeSuccessStatePageWide({
    super.key,
    required this.data,
    required this.onRefresh,
    required this.onTapUrl,
  });

  final ResumeOverviewEntity data;
  final RefreshCallback onRefresh;
  final ValueSetter<String> onTapUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Material(
      color: context.colorScheme.surface,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                const Positioned.fill(child: BackgroundSplit()),
                const Positioned(
                  top: 0,
                  bottom: 0,
                  right: 16,
                  child: HighResolutionImage(
                    assetPath: DsAssetsPhotos.professionalSuitDistractedPng,
                    ratio: 3330 / 5000,
                  ),
                ),
                Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 1440),
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          data.prefix,
                          style: textTheme.displaySmall?.copyWith(
                            shadows: [
                              Shadow(
                                color: context.colorScheme.surface,
                                offset: const Offset(1, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        SelectableText(
                          data.name,
                          style: textTheme.displayLarge?.copyWith(
                            fontSize: 84,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                            shadows: [
                              Shadow(
                                color: context.colorScheme.surface,
                                offset: const Offset(1, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        SelectableText(
                          data.title,
                          style: textTheme.headlineSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            shadows: [
                              Shadow(
                                color: context.colorScheme.surface,
                                offset: const Offset(1, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16 * 3,
                        ),
                        Row(
                          spacing: 16,
                          children: [
                            SocialIconWidget(
                              DsAssetsResources.linkedinSvg,
                              onTap: () {
                                onTapUrl(data.linkedinUrl);
                              },
                            ),
                            SocialIconWidget(
                              DsAssetsResources.githubSvg,
                              onTap: () {
                                onTapUrl(data.githubUrl);
                              },
                            ),
                            SocialIconWidget(
                              DsAssetsResources.curriculumVitaeSvg,
                              onTap: () {
                                onTapUrl(data.cvUrl);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
