import 'package:flutter/material.dart';

import '../../../../app/extensions/context_extensions.dart';
import '../../../components/experience_company_card_widget.dart';
import '../../../controller/experience_store.dart';

class ExperiencePageSuccessStateWide extends StatelessWidget {
  const ExperiencePageSuccessStateWide(
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0 * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16 * 6,
              ),
              Column(
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
              const SizedBox(
                height: 32,
              ),
              Text(
                'Overview',
                style: context.textTheme.titleLarge,
              ),
              Text(
                state.experienceObject.overview,
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16.0 * 2),
          physics: const NeverScrollableScrollPhysics(),
          itemCount:
              state.experienceObject.experienceCompanyList.length * 2 - 1,
          itemBuilder: (context, index) {
            if (index.isEven) {
              return ExperienceCompanyCardWidget(
                experience:
                    state.experienceObject.experienceCompanyList[index ~/ 2],
              );
            }

            return const SizedBox(height: 16);
          },
        ),
      ],
    );
  }
}
