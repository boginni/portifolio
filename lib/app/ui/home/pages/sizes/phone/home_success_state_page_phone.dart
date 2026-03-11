import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_overview_entity.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../components/high_resolution_image.dart';
import '../../../components/professional_summary_widget.dart';
import '../../../components/social_card_widget.dart';
import '../../../components/social_carousel_widget.dart';

class HomeSuccessStatePagePhone extends StatelessWidget {
  const HomeSuccessStatePagePhone(
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
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  'Welcome back!!!',
                  style: context.textTheme.titleLarge,
                ),
                const Text('Feel Free to explore the app.'),
              ],
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.6,
            child: const HighResolutionImage(
              assetPath: DsAssetsPhotos.purpleTCrossedArmsPng,
              ratio: 3330 / 5000,
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: context.textTheme.titleLarge,
                ),
                Text(data.status),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              spacing: 16,
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
          ),
          const SizedBox(height: 16),
          Semantics(
            explicitChildNodes: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  ProfessionalSummaryWidget(
                    data.professionalSummary,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SocialCarouselWidget(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
