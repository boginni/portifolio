import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_overview_entity.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../components/background_split.dart';
import '../../../components/high_resolution_image.dart';
import '../../../components/professional_summary_widget.dart';
import '../../../components/social_icon_widget.dart';

class HomeSuccessStatePageWide extends StatelessWidget {
  const HomeSuccessStatePageWide({
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
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
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
                                Text('Hi, I am', style: textTheme.displaySmall),
                                // Upscaled for Wide
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
                                        .withOpacity(0.7),
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

            // OVERVIEW SECTION
            Container(
              width: double.infinity,
              color: colorScheme.inverseSurface,
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  // Narrower for readability
                  padding: const EdgeInsets.symmetric(
                    vertical: 80,
                    horizontal: 32,
                  ),
                  child: Semantics(
                    explicitChildNodes: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Overview',
                          style: textTheme.displaySmall?.copyWith(
                            // Larger header
                            color: colorScheme.onInverseSurface,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Divider(thickness: 2),
                        const SizedBox(height: 24),
                        ProfessionalSummaryWidget(
                          data.professionalSummary,
                          textStyle: textTheme.titleLarge?.copyWith(
                            // Larger body text for wide screens
                            color: colorScheme.onInverseSurface,
                            height: 1.6,
                            fontWeight: FontWeight.w300,
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
      ),
    );
  }
}
