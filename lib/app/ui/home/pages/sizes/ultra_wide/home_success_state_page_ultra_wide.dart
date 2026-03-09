import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_overview_entity.dart';
import '../../../../app/components/inverse_brightness_builder.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../components/background_split.dart';
import '../../../components/high_resolution_image.dart';
import '../../../../skills/professional_background_component.dart';
import '../../../components/professional_summary_widget.dart';
import '../../../components/social_icon_widget.dart';

class HomeSuccessStatePageUltraWide extends StatelessWidget {
  const HomeSuccessStatePageUltraWide({
    super.key,
    required this.data,
    required this.onRefresh,
  });

  final ResumeOverviewEntity data;
  final RefreshCallback onRefresh;

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
                Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 1440),
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, I am',
                                style: textTheme.displaySmall,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                data.name,
                                style: textTheme.displayLarge?.copyWith(
                                  fontSize: 84,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                data.title,
                                style: textTheme.headlineSmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant
                                      .withValues(alpha: 0.7),
                                ),
                              ),
                              const SizedBox(height: 48),
                              const Row(
                                children: [
                                  SocialIconWidget(Icons.alternate_email),
                                  SizedBox(width: 16),
                                  SocialIconWidget(Icons.code),
                                  SizedBox(width: 16),
                                  SocialIconWidget(Icons.link),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const HighResolutionImage(
                          assetPath:
                              DsAssetsPhotos.professionalSuitDistractedPng,
                          ratio: 3330 / 5000,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: colorScheme.inverseSurface,
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1080),
                padding: const EdgeInsets.symmetric(
                  vertical: 16 * 4,
                  horizontal: 16 * 2,
                ),
                child: Semantics(
                  explicitChildNodes: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'About me',
                            style: textTheme.displaySmall?.copyWith(
                              color: colorScheme.onInverseSurface,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ProfessionalSummaryWidget(
                        data.professionalSummary,
                        textStyle: textTheme.titleLarge?.copyWith(
                          color: colorScheme.onInverseSurface,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
