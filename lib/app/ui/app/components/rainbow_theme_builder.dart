import 'dart:math';

import 'package:flutter/material.dart';

class RainbowThemeBuilder extends StatefulWidget {
  const RainbowThemeBuilder({
    super.key,
    required this.builder,
  });

  final Function(BuildContext context, ThemeData theme) builder;

  @override
  State<RainbowThemeBuilder> createState() => _RainbowThemeBuilderState();
}

class _RainbowThemeBuilderState extends State<RainbowThemeBuilder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final hue = (_controller.value * 360).toInt();

        final theme = ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: HSVColor.fromAHSV(1, hue.toDouble(), 1, 1).toColor(),
          ),
          useMaterial3: true,
        );

        return Theme(
          data: theme,
          child: Builder(
            builder:
                (context) => widget.builder(
                  context,
                  theme,
                ),
          ),
        );
      },
    );
  }
}
