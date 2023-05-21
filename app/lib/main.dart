import 'package:core/app/base_app.dart';
import 'package:core/app/micro_app.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:identity/app/identity_module_resolver.dart';

import 'app/ui/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseApp {
  MyApp({super.key}) {
    super.registerDependencyInjection();
    super.registerRouters();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Movye App',
      routerConfig: super.generateRoute(),
    );
  }

  @override
  List<RouteBase> get baseRoutes => [
        GoRoute(path: '/', builder: (_, __) => const SplashPage()),
      ];

  @override
  List<MicroApp> get microApps => [
        IdentityModuleResolver(),
      ];
}
