import 'package:flutter/material.dart';
import '../../../components/experience_list_loading_component.dart';

class ExperiencePageDesktopLoadingState extends StatelessWidget {
  const ExperiencePageDesktopLoadingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 32,
      children: [
        SizedBox(
          height: 16 * 4,
        ),
        ExperienceListLoadingComponent(),
      ],
    );
  }
}
