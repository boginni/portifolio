import 'package:ds_assets/ds_assets.dart';
import 'package:flutter/material.dart';

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
      child: Material(
        color: context.colorScheme.primaryContainer,
        shape: const CircleBorder(),
        child: Transform.scale(
          scale: 1.5,
          alignment: Alignment.topCenter,
          child: Image.asset(
            DsAssetsPhotos.purpleTCrossedArmsPng,
            fit: BoxFit.cover,
            alignment: const Alignment(0, -.5),
          ),
        ),
      ),
    );
  }
}
