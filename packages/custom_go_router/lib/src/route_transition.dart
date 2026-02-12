import 'package:go_router/go_router.dart';

import 'router_config.dart';

abstract class RouteTransition {
  const RouteTransition();

  GoRouterPageBuilder pageBuilder(AppRouteConfig config);
}
