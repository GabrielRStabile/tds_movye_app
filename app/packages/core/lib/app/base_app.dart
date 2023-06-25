import 'package:core/app/micro_app.dart';
import 'package:core/app/micro_core_utils.dart';
import 'package:core/app/ui/pages/not_found_page.dart';
import 'package:core/app/utils/api_caller_util.dart';
import 'package:core/app/utils/local_storage/ilocal_storage_util.dart';
import 'package:core/app/utils/local_storage/shared_preferences_local_storage_util.dart';
import 'package:dependencies/dependencies.dart';

/// Base class for an application.
///
/// Subclasses of [BaseApp] define the configuration and behavior of the
/// application.
/// It provides methods for registering routes and dependency injection,
/// as well as generating the application's route configuration.
abstract class BaseApp {
  /// Returns a list of [MicroApp] instances that compose the application.
  ///
  /// Each [MicroApp] represents a modular part of the application, containing
  /// its own routes and dependencies.
  List<MicroApp> get microApps;

  /// Returns a list of base routes that are common to all [MicroApp] instances.
  ///
  /// These routes will be included in the application's route configuration.
  List<RouteBase> get baseRoutes;

  /// Contain the list of routes of the application.
  final List<RouteBase> routes = [];

  /// Contain the list of dependencies of the application.
  final List<AutoInjector> injections = [];

  /// Registers the routes of the application.
  ///
  /// It adds the base routes and the routes of each [MicroApp] to the [routes]
  /// list.
  void registerRouters() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (final microapp in microApps) {
        routes.addAll(microapp.routes);
      }
    }
  }

  /// Registers the dependency injection configuration of the application.
  ///
  /// It adds the dependency injections of each [MicroApp] to the [injections]
  /// list.
  /// Then, it creates an [AutoInjector] instance with the [injections] list
  /// and commits the injections to the injector.
  void registerDependencyInjection() {
    if (microApps.isNotEmpty) {
      for (final microapp in microApps) {
        injections.add(microapp.injectionsRegister);
      }
      autoInjector = AutoInjector(
        tag: 'app',
        on: (injector) {
          injector
            ..add<ILocalStorageUtil>(
              SharedPreferencesLocalStorageUtil.new,
            )
            ..addLazySingleton<ApiCallerUtil>(ApiCallerUtil.new);
          for (final injection in injections) {
            injector.addInjector(injection);
          }
          injector.commit();
        },
      );
    }
  }

  /// Generates the route configuration for the application.
  ///
  /// It creates a [GoRouter] instance with the combined base routes and routes
  /// of each [MicroApp]. If a route is not found, it displays the
  /// [NotFoundPage].
  GoRouter generateRoute() {
    return _getRouter(baseApp: this);
  }

  static GoRouter? _cachedRouter;

  static GoRouter _getRouter({required BaseApp baseApp}) {
    _cachedRouter ??= GoRouter(
      navigatorKey: navigatorKey,
      routes: [...baseApp.baseRoutes, ...baseApp.routes],
      errorBuilder: (_, __) => const NotFoundPage(),
      debugLogDiagnostics: true,
    );
    return _cachedRouter!;
  }
}
