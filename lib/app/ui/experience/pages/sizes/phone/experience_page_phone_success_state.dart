import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../app/extensions/context_extensions.dart';
import '../../../../home/components/high_resolution_image.dart';
import '../../../components/career_overview_component.dart';
import '../../../components/experience_company_card_widget.dart';
import '../../../controller/experience_store.dart';

class ExperiencePagePhoneSuccessState extends StatelessWidget {
  const ExperiencePagePhoneSuccessState(
    this.state, {
    super.key,
    required this.onRefresh,
  });

  final ExperienceStoreSuccessState state;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: 16 * 22,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: context.colorScheme.outline,
                        width: 1,
                      ),
                    ),
                  ),
                  child: const HighResolutionImage(
                    assetPath: DsAssetsPhotos.professionalSuitDistractedPng,
                    ratio: 3330 / 5000,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        context.colorScheme.surface.withValues(alpha: 0.1),
                        context.colorScheme.surface,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        context.l10n.my_experience,
                        style: context.textTheme.displaySmall?.copyWith(
                          shadows: [
                            const Shadow(
                              offset: Offset(1, -1),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                      ),
                      SelectableText(
                        state.experienceObject.carrierTitle,
                        style: context.textTheme.bodyLarge?.copyWith(
                          shadows: [
                            const Shadow(
                              offset: Offset(1, -1),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CareerOverviewComponent(
                    experience: state.experienceObject,
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24,
            ),
            sliver: SliverList.builder(
              itemCount: state.experienceObject.experienceCompanyList.length,
              itemBuilder:
                  (context, index) => Column(
                    children: [
                      ExperienceCompanyCardWidget(
                        experience:
                            state.experienceObject.experienceCompanyList[index],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 140 * 3,
                  width: double.infinity,
                  child: HighResolutionImage(
                    assetPath: DsAssetsPhotos.workingMacPng,
                    ratio: 3330 / 5000,
                    fit: BoxFit.cover,
                    alignment: Alignment(0, -.2),
                  ),
                ),
                SizedBox(height: 64),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
