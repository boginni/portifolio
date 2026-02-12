import 'package:flutter/material.dart';

import 'router_config.dart';

class RouteWrapper extends StatefulWidget {
  const RouteWrapper({
    required this.config,
    required this.params,
    super.key,
    this.extra,
  });

  final AppRouteConfig config;
  final Map<String, String> params;
  final Object? extra;

  @override
  State<RouteWrapper> createState() => _RouteWrapperState();
}

class _RouteWrapperState extends State<RouteWrapper> {
  late final AppRoute _route;

  @override
  void initState() {
    super.initState();
    _route = widget.config.getRouteFromParams(widget.params);
  }

  @override
  Widget build(BuildContext context) {
    return _route.toScreen(extra: widget.extra);
  }
}
