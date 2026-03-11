import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../../app/extensions/context_extensions.dart';
import '../../../../home/components/high_resolution_image.dart';
import '../../../components/career_overview_component.dart';
import '../../../components/experience_company_card_widget.dart';
import '../../../controller/experience_store.dart';

class ExperiencePageSuccessStateUltraWide extends StatelessWidget {
  const ExperiencePageSuccessStateUltraWide(
    this.state, {
    super.key,
    required this.onRefresh,
  });

  final ExperienceStoreSuccessState state;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 32,
      children: [
        const SizedBox(
          height: 16 * 4,
        ),
        _List(state: state),
        Column(
          children: [
            SizedBox(
              height: 16 * 10 * 10,
              width: double.infinity,
              child: HighResolutionImage(
                assetPath:
                    context.isDarkMode
                        ? DsAssetsPhotos.professionalFullSuitSeriousPng
                        : DsAssetsPhotos.workingMacPng,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                ratio: 3330 / 5000,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _List extends StatelessWidget {
  const _List({required this.state});

  final ExperienceStoreSuccessState state;

  @override
  Widget build(BuildContext context) {
    final companies = state.experienceObject.experienceCompanyList;

    final children = List<Widget>.generate(
      companies.length,
      (index) => ExperienceCompanyCardWidget(
        experience: companies[index],
      ),
    );

    children.insert(
      0,
      Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: CareerOverviewComponent(
          experience: state.experienceObject,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0 * 3),
      child: FixedTimeline.tileBuilder(
        theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
        ),
        builder: TimelineTileBuilder(
          itemCount: children.length,
          contentsAlign: ContentsAlign.basic,
          contentsBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  bottom: 16.0,
                ),
                child: children[index],
              ),
          indicatorBuilder:
              (_, index) => Indicator.dot(
                // borderWidth: 1.0,
                color: context.colorScheme.primaryContainer,
              ),
          startConnectorBuilder:
              (_, index) =>
                  index == 0
                      ? null
                      : Connector.solidLine(
                        color: context.colorScheme.primaryContainer,
                      ),
          endConnectorBuilder:
              (_, index) =>
                  index == children.length - 1
                      ? null
                      : Connector.solidLine(
                        color: context.colorScheme.primaryContainer,
                      ),
        ),
      ),
    );
  }
}
