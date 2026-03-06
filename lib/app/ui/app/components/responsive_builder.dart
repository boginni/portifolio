import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final WidgetBuilder phone;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;
  final WidgetBuilder? wide;
  final WidgetBuilder? ultraWide;

  const ResponsiveBuilder({
    super.key,
    required this.phone,
    this.tablet,
    this.desktop,
    this.wide,
    this.ultraWide,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = MediaQuery.of(context).size.width;

        final builder =
            switch (width) {
              >= 1920 => ultraWide ?? wide ?? desktop ?? tablet,
              >= 1440 => wide ?? desktop ?? tablet,
              >= 1024 => desktop ?? tablet,
              >= 600 => tablet,
              _ => null,
            } ??
            phone;

        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
            minWidth: constraints.maxWidth,
          ),
          child: builder(context),
        );
      },
    );
  }
}
