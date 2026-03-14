import 'package:flutter/material.dart';

class CustomFontBuilder extends StatelessWidget {
  const CustomFontBuilder({
    super.key,
    required this.fontFamily,
    required this.builder,
  });

  final TextTheme Function([TextTheme? textTheme]) fontFamily;
  final Function(BuildContext context, ThemeData theme) builder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = fontFamily(theme.textTheme);

    return Theme(
      data: theme.copyWith(textTheme: textTheme),
      child: Builder(
        builder: (context) => builder(context, theme),
      ),
    );
  }
}
