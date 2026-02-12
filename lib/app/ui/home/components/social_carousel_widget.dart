import 'package:flutter/material.dart';

import '../../app/extensions/context_extensions.dart';

class SocialCarouselWidget extends StatelessWidget {
  const SocialCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: context.colorScheme.surfaceContainerHighest,
      child: const SizedBox(
        height: 140,
        width: double.infinity,
      ),
    );
  }
}
