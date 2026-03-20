import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_overview_entity.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../components/high_resolution_image.dart';
import '../../../components/professional_summary_widget.dart';
import '../../../components/social_carousel_widget.dart';
import '../../../components/social_icon_widget.dart';

class HomeSuccessStatePageTablet extends StatelessWidget {
  const HomeSuccessStatePageTablet(
    this.data, {
    super.key,
    required this.onRefresh,
        required this.onTapUrl,
  });

  final ResumeOverviewEntity data;
  final RefreshCallback onRefresh;
  final ValueSetter<String> onTapUrl;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        padding: const EdgeInsets.all(32.0), // Generous padding for tablet
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Side: Portrait and Identity
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: const SizedBox(
                        height: 500,
                        child: HighResolutionImage(
                          assetPath: DsAssetsPhotos.purpleTCrossedArmsPng,
                          ratio: 3330 / 5000,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SelectableText(
                      data.title,
                      style: context.textTheme.headlineSmall,
                      // Bigger for tablet
                      textAlign: TextAlign.center,
                    ),
                    SelectableText(
                      data.status,
                      style: context.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    const SocialCarouselWidget(),
                  ],
                ),
              ),

              const SizedBox(width: 48), // Large gutter between columns
              // Right Side: Content and Actions
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      context.l10n.welcome_back,
                      style: context.textTheme.displaySmall,
                    ),
                    SelectableText(context.l10n.feel_free_to_explore_the_app),
                    const SizedBox(height: 32),

                    // Social Actions (Grid-like Row)
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

                    const SizedBox(height: 40),

                    Semantics(
                      explicitChildNodes: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Semantics(
                            header: true,
                            child: SelectableText(
                              data.prefix,
                              style: context.textTheme.titleLarge,
                            ),
                          ),
                          const Divider(),
                          const SizedBox(height: 8),
                          ProfessionalSummaryWidget(
                            data.professionalSummary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
