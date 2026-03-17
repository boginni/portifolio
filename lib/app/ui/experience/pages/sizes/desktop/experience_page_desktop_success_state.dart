import 'package:flutter/material.dart';

import '../../../../app/extensions/context_extensions.dart';
import '../../../components/experience_company_card_widget.dart';
import '../../../components/experience_list_component.dart';
import '../../../controller/experience_store.dart';

class ExperiencePageDesktopSuccessState extends StatelessWidget {
  const ExperiencePageDesktopSuccessState(
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
      children: [
        const SizedBox(
          height: 16 * 4,
        ),
        ExperienceListComponent(
          state: state,
        ),
      ],
    );
  }
}
