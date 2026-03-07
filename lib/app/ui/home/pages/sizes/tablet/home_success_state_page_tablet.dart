import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_overview_entity.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../components/high_resolution_image.dart';
import '../../../components/professional_summary_widget.dart';
import '../../../components/social_card_widget.dart';
import '../../../components/social_carousel_widget.dart';

class HomeSuccessStatePageTablet extends StatelessWidget {
  const HomeSuccessStatePageTablet(
    this.data, {
    super.key,
    required this.onRefresh,
  });

  final ResumeOverviewEntity data;
  final RefreshCallback onRefresh;

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
                          assetPath:
                              DsAssetsPhotos
                                  .purpleTCrossedArmsPng,
                          ratio: 3330 / 5000,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      data.title,
                      style: context.textTheme.headlineSmall,
                      // Bigger for tablet
                      textAlign: TextAlign.center,
                    ),
                    Text(
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
                    Text(
                      'Welcome back!!!',
                      style: context.textTheme.displaySmall,
                    ),
                    const Text('Feel Free to explore the app.'),
                    const SizedBox(height: 32),

                    // Social Actions (Grid-like Row)
                    const Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SocialCardWidget(
                          title: 'Linkedin',
                          icon: DsAssetsResources.linkedinSvgrepoComSvg,
                        ),
                        SocialCardWidget(
                          title: 'Currículo',
                          icon: DsAssetsResources.curriculumVitaeSvgrepoComSvg,
                        ),
                        SocialCardWidget(
                          title: 'Github',
                          icon: DsAssetsResources.github142SvgrepoComSvg,
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
                            child: Text(
                              'Overview',
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
