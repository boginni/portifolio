import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../app/extensions/context_extensions.dart';

class ProfessionalBackgroundComponent extends StatelessWidget {
  const ProfessionalBackgroundComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 1080,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16 * 2,
          ),
          child: Column(
            children: [
              Divider(),
              SizedBox(
                height: 16 * 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Professional",
                          style: textTheme.headlineMedium?.copyWith(),
                        ),
                        Text(
                          "Background Skills and\nAccomplishments",
                          style: textTheme.headlineSmall?.copyWith(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.",
                      style: textTheme.bodySmall?.copyWith(),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16 * 3),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children:
              DsAssetsIcons.values().map(
                (e) {
                  const size = 16 * 6.0;

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        size * .33,
                      ),
                      child: Image.asset(
                        e,
                        width: size,
                        height: size,
                      ),
                    ),
                  );
                },
              ).toList(),
        ),
      ],
    );
  }
}
