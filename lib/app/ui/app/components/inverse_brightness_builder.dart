import 'package:flutter/material.dart';

class InverseBrightnessBuilder extends StatelessWidget {
  const InverseBrightnessBuilder({
    super.key,
    required this.builder,
  });

  final Function(BuildContext context, ThemeData theme) builder;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = isDark ? ThemeData.light(useMaterial3: true) : ThemeData.dark(useMaterial3: true);

    return Theme(
      data: theme,
      child: Builder(builder: (context) => builder(context, theme)),
    );
  }
}
