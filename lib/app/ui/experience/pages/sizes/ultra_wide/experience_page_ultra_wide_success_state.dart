import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../../../app/extensions/context_extensions.dart';
import '../../../../home/components/high_resolution_image.dart';
import '../../../components/experience_list_component.dart';
import '../../../controller/experience_store.dart';

class ExperiencePageUltraWideSuccessState extends StatelessWidget {
  const ExperiencePageUltraWideSuccessState(
    this.state, {
    super.key,
    required this.onRefresh,
  });

  final ExperienceStoreSuccessState state;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final breathSpace = (2700.0 - context.width).clamp(0, 16 * 18).toDouble();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 32,
      children: [
        const SizedBox(
          height: 16 * 4,
        ),
        ExperienceListComponent(
          state: state,
        ),
        SizedBox(
          height: breathSpace,
        ),
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
                alignment: Alignment.bottomRight,
                ratio: 3330 / 5000,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
