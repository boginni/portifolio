import 'package:flutter/material.dart';

import '../../app/components/svg_icon.dart';

class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget(
    this.icon, {
    super.key,
    this.onTap,
  });

  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: onTap,
      padding: const EdgeInsets.all(8),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
      ),
      icon: SvgIcon(
        icon,
        size: 24,
      ),
    );
  }
}
