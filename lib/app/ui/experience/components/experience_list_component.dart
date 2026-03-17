import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../app/extensions/context_extensions.dart';
import '../controller/experience_store.dart';
import 'career_overview_component.dart';
import 'experience_company_card_widget.dart';

class ExperienceListComponent extends StatelessWidget {
  const ExperienceListComponent({
    super.key,
    required this.state,
  });

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
