import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../app/extensions/context_extensions.dart';
import '../../../../home/components/high_resolution_image.dart';
import '../../../components/experience_list_loading_component.dart';

class ExperiencePageUltraWideLoadingState extends StatelessWidget {
  const ExperiencePageUltraWideLoadingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 32,
      children: [
        const SizedBox(
          height: 16 * 4,
        ),
        const ExperienceListLoadingComponent(),
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
