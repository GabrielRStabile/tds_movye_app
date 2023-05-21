import 'package:core/app/ui/pages/not_found_page.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/widgets.dart';

import 'micro_app.dart';

abstract class BaseApp {
  List<MicroApp> get microApps;

  List<RouteBase> get baseRoutes;

  final List<RouteBase> routes = [];

  void registerRouters() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        routes.addAll(microapp.routes);
      }
    }
  }

  void registerDependencyInjection() {
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        microapp.injectionsRegister();
      }
    }
  }

  RouterConfig<Object>? generateRoute() {
    return GoRouter(
      routes: [...baseRoutes, ...routes],
      errorBuilder: (_, __) => const NotFoundPage(),
    );
  }
}
