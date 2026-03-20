import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/dto/entities/resume_overview_entity.dart';
import '../../../../app/components/profile_avatar_widget.dart';
import '../../../../app/extensions/context_extensions.dart';
import '../../../components/professional_summary_widget.dart';
import '../../../components/social_carousel_widget.dart';
import '../../../components/social_icon_widget.dart';

class HomeSuccessStatePagePhone extends StatelessWidget {
  const HomeSuccessStatePagePhone(
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
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ProfileAvatarWidget(),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: context.textTheme.headlineMedium,
                ),
                Text(
                  data.title,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
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
