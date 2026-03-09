import 'package:flutter/material.dart';

enum ResponsiveDisplaySizeEnum {
  phone,
  tablet,
  desktop,
  wide,
  ultraWide,
}

class ResponsiveBuilder extends StatelessWidget {
  final WidgetBuilder phone;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;
  final WidgetBuilder? wide;
  final WidgetBuilder? ultraWide;

  final ResponsiveDisplaySizeEnum? forceDisplaySize;

  const ResponsiveBuilder({
    super.key,
    required this.phone,
    this.tablet,
    this.desktop,
    this.wide,
    this.ultraWide,
    this.forceDisplaySize,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final builder = () {
      if (forceDisplaySize != null) {
        return switch (forceDisplaySize!) {
              ResponsiveDisplaySizeEnum.ultraWide =>
                ultraWide ?? wide ?? desktop ?? tablet,

              ResponsiveDisplaySizeEnum.wide => wide ?? desktop ?? tablet,
              ResponsiveDisplaySizeEnum.desktop => desktop ?? tablet,
              ResponsiveDisplaySizeEnum.tablet => tablet,
              ResponsiveDisplaySizeEnum.phone => phone,
            } ??
            phone;
      }

      return switch (width) {
            >= 2560 => ultraWide ?? wide ?? desktop ?? tablet,
            >= 1440 => wide ?? desktop ?? tablet,
            >= 1024 => desktop ?? tablet,
            >= 600 => tablet,
            _ => null,
          } ??
          phone;
    }();

    return builder(context);
  }
}
