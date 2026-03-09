import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/cupertino.dart';

import '../app/extensions/context_extensions.dart';
import '../home/components/high_resolution_image.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 720,
          width: double.infinity,
          child: HighResolutionImage(
            assetPath: DsAssetsPhotos.tdcPng,
            fit: BoxFit.cover,
            ratio: 1,
            useCacheHeight: false,
          ),
        ),
        Container(
          width: double.infinity,
          color: context.colorScheme.inverseSurface,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              padding: const EdgeInsets.symmetric(
                vertical: 16 * 2,
                horizontal: 16 * 2,
              ),
              child: Semantics(
                explicitChildNodes: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Developers Conference - SP | 2025',
                      style: context.textTheme.displaySmall?.copyWith(
                        color: context.colorScheme.onInverseSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
