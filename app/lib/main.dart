import 'package:core/app/base_app.dart';
import 'package:core/app/micro_app.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/app/home_module_resolver.dart';
import 'package:home/app/watch_submodule_resolver.dart';
import 'package:identity/app/identity_module_resolver.dart';

import 'package:tds_movye_app/app/ui/pages/splash_page.dart';

Future<void> main() async {
  await dotenv.load();

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
      debugShowCheckedModeBanner: false,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('pt', 'BR')],
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF806BFF),
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
          ),
          fillColor: const Color(0xFF1D1D1D),
          filled: true,
        ),
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
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
        HomeModuleResolver(),
        WatchSubmoduleResolver(),
      ];
}
