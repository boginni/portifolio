import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../app/extensions/context_extensions.dart';
import '../components/experience_company_card_widget.dart';
import '../experience_store.dart';

class ExperienceSuccessStatePage extends StatelessWidget {
  const ExperienceSuccessStatePage(
    this.state, {
    super.key,
    required this.onRefresh,
  });

  final ExperienceStoreSuccessState state;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Image.asset(
                  height: 16 * 22,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  DsAssetsPhotos.professionalSuitDistractedPng,
                  alignment: Alignment.topCenter,
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
                      Text(
                        'My Experience',
                        style: context.textTheme.displaySmall?.copyWith(
                          color: context.colorScheme.surfaceContainerHighest,
                        ),
                      ),
                      Text(
                        'Senior Software Engineer',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.colorScheme.surfaceContainerHighest,
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Overview',
                        style: context.textTheme.titleLarge,
                      ),
                      const Text(
                        'Currently a Senior Software Engineer at Cognizant, contributing to MGM Rewards with a focus on complex UI and app architecture. ',
                      ),
                    ],
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
              itemCount: state.experienceCompanyList.length * 2 - 1,
              itemBuilder: (context, index) {
                if (index.isEven) {
                  return ExperienceCompanyCardWidget(
                    experience: state.experienceCompanyList[index ~/ 2],
                  );
                }

                return const SizedBox(height: 16);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 140 * 3,
                  width: double.infinity,
                  child: Image.asset(
                    fit: BoxFit.cover,
                    DsAssetsPhotos.workingMacPng,
                  ),
                ),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
