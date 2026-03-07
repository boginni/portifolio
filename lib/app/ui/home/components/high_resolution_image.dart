import 'package:flutter/material.dart';

class HighResolutionImage extends StatelessWidget {
  const HighResolutionImage({
    super.key,
    required this.assetPath,
    this.fit = BoxFit.contain,
    required this.ratio,
    this.fadeDuration = const Duration(milliseconds: 800),
    this.alignment = Alignment.center,
    this.useCacheHeight = true,
  });

  final String assetPath;
  final BoxFit fit;
  final double ratio;
  final Duration fadeDuration;
  final AlignmentGeometry alignment;
  final bool useCacheHeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

        final int calculatedCacheHeight =
            (constraints.maxHeight * devicePixelRatio).round();

        return AspectRatio(
          aspectRatio: ratio,
          child: Image.asset(
            assetPath,
            fit: fit,
            alignment: alignment,
            cacheHeight: useCacheHeight ?
                calculatedCacheHeight > 0 ? calculatedCacheHeight : null : null,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) return child;

              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: fadeDuration,
                curve: Curves.easeOut,
                child: child,
              );
            },
            errorBuilder:
                (context, error, stackTrace) => const Center(
                  child: Icon(Icons.broken_image, color: Colors.grey),
                ),
          ),
        );
      },
    );
  }
}
