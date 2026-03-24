import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

import '../../home/components/high_resolution_image.dart';
import '../extensions/context_extensions.dart';

class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      shape: LinearBorder.bottom(
        side: BorderSide(
          color: context.colorScheme.outline,
        ),
      ),
      child: AspectRatio(
        aspectRatio: 3330 / 5000,
        child: Material(
          color: context.colorScheme.primaryContainer,
          shape: const CircleBorder(),
          child: Transform.scale(
            scale: 1.5,
            alignment: Alignment.topCenter,
            child: const HighResolutionImage(
              fit: BoxFit.cover,
              alignment: Alignment(0, -.5),
              assetPath: DsAssetsPhotos.purpleTCrossedArmsPng,
              ratio: 3330 / 5000,
            ),
          ),
        ),
      ),
    );
  }
}
