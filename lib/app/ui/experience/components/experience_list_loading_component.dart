import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../app/extensions/context_extensions.dart';

class ExperienceListLoadingComponent extends StatelessWidget {
  const ExperienceListLoadingComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final children = List<Widget>.generate(
      14,
      (index) => Card(
        elevation: 0,
        shape: ContinuousRectangleBorder(
          side: BorderSide(color: context.colorScheme.outline),
          borderRadius: BorderRadius.circular(
            16 * 3,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: const SizedBox(
          height: 16 * 10,
          width: double.infinity,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );

    children.insert(
      0,
      const Padding(
        padding: EdgeInsets.only(bottom: 32.0),
        child: SizedBox(
          height: 16 * 14,
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
