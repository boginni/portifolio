import 'package:flutter/material.dart';

import '../../app/extensions/context_extensions.dart';

class BackgroundSplit extends StatelessWidget {
  const BackgroundSplit({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.sizeOf(context),
      painter: _BackgroundSplit(
        leftColor: context.colorScheme.surface,
        rightColor: context.colorScheme.onSurface,
        center: .5,
        offset: .1,
      ),
    );
  }
}

class _BackgroundSplit extends CustomPainter {
  const _BackgroundSplit({
    required this.leftColor,
    required this.rightColor,
    this.center = .5,
    this.offset = .1,
  });

  final Color leftColor;
  final Color rightColor;
  final double center;
  final double offset;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // paint.color = leftColor;
    // final pathLeft =
    //     Path()
    //       ..lineTo(size.width * (center + offset), 0)
    //       ..lineTo(size.width * (center - offset), size.height)
    //       ..lineTo(0, size.height)
    //       ..close();
    // canvas.drawPath(pathLeft, paint);

    // Right Side (Black)
    paint.color = rightColor;
    final pathRight =
        Path()
          ..moveTo(size.width * (center + offset), 0)
          ..lineTo(size.width, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(size.width * (center - offset), size.height)
          ..close();
    canvas.drawPath(pathRight, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
