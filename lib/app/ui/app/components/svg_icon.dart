import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetName;
  final double? size;
  final Color? color;

  const SvgIcon(
    this.assetName, {
    super.key,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    final resolvedColor = color ?? iconTheme.color;
    final resolvedSize = size ?? iconTheme.size;

    return SvgPicture.asset(
      assetName,
      colorFilter:
          resolvedColor != null
              ? ColorFilter.mode(resolvedColor, BlendMode.srcIn)
              : null,
      width: resolvedSize,
      height: resolvedSize,
    );
  }
}
