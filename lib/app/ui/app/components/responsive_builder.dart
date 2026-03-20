import 'package:flutter/material.dart';

import '../../../domain/environment.dart';

enum ResponsiveDisplaySizeEnum {
  unsupported,
  phone,
  tablet,
  desktop,
  wide,
  ultraWide;

  const ResponsiveDisplaySizeEnum();

  static ResponsiveDisplaySizeEnum? fromString(String value) {
    return values.where((element) => element.name == value).firstOrNull;
  }
}

class ResponsiveBuilder extends StatelessWidget {
  final WidgetBuilder? unsupported;
  final WidgetBuilder? phone;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;
  final WidgetBuilder? wide;
  final WidgetBuilder? ultraWide;

  final ResponsiveDisplaySizeEnum? forceDisplaySize;

  static final ResponsiveDisplaySizeEnum? _environmentForceLayout =
      ResponsiveDisplaySizeEnum.fromString(Environment.forceLayout);

  const ResponsiveBuilder({
    super.key,
    this.phone,
    this.tablet,
    this.desktop,
    this.wide,
    this.ultraWide,
    this.forceDisplaySize,
    this.unsupported,
  });

  const ResponsiveBuilder.required({
    super.key,
    this.forceDisplaySize,
    required this.phone,
    required this.tablet,
    required this.desktop,
    required this.wide,
    required this.ultraWide,
    required this.unsupported,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final layoutSize = _environmentForceLayout ?? forceDisplaySize;

    final builder = () {
      if (layoutSize != null) {
        return switch (layoutSize) {
          ResponsiveDisplaySizeEnum.ultraWide =>
            ultraWide ?? wide ?? desktop ?? tablet,

          ResponsiveDisplaySizeEnum.wide => wide ?? desktop ?? tablet,
          ResponsiveDisplaySizeEnum.desktop => desktop ?? tablet,
          ResponsiveDisplaySizeEnum.tablet => tablet ?? phone,
          ResponsiveDisplaySizeEnum.phone => phone,
          ResponsiveDisplaySizeEnum.unsupported => unsupported,
        };
      }

      return switch (width) {
        >= 1920 => ultraWide ?? wide ?? desktop ?? tablet,
        >= 1440 => wide ?? desktop ?? tablet,
        >= 1024 => desktop ?? tablet,
        >= 560 => tablet ?? phone,
        >= 320 => phone,
        _ => unsupported,
      };
    }();

    return builder?.call(context) ?? const Offstage();
  }
}
