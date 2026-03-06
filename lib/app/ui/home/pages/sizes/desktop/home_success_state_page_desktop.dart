import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_overview_entity.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../components/background_split.dart';
import '../../../components/high_resolution_image.dart';
import '../../../components/professional_summary_widget.dart';
import '../../../components/social_icon_widget.dart';

class HomeSuccessStatePageDesktop extends StatelessWidget {
  const HomeSuccessStatePageDesktop({
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

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Material(
        color: context.colorScheme.surface,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Positioned.fill(
                    child: BackgroundSplit(),
                  ),
                  const Positioned(
                    top: 0,
                    bottom: 0,
                    right: 16,
                    child: HighResolutionImage(
                      assetPath: DsAssetsPhotos.professionalSuitDistractedPng,
                      ratio: 3330 / 5000,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 64.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hi, I am', style: textTheme.headlineSmall),
                          const SizedBox(height: 16),
                          Text(
                            data.name,
                            style: textTheme.displayLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            data.title,
                            style: textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant.withOpacity(
                                0.7,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16 * 2,
                          ),
                          const Row(
                            children: [
                              SocialIconWidget(Icons.alternate_email),
                              SocialIconWidget(Icons.code),
                              SocialIconWidget(Icons.link),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(32),
              width: double.infinity,
              color: colorScheme.inverseSurface,
              child: Semantics(
                explicitChildNodes: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Semantics(
                      header: true,
                      child: Text(
                        'Overview',
                        style: context.textTheme.titleLarge?.copyWith(
                          color: context.colorScheme.onInverseSurface,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    ProfessionalSummaryWidget(
                      data.professionalSummary,
                      textStyle: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onInverseSurface,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
