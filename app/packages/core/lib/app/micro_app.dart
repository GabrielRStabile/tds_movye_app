import 'package:dependencies/dependencies.dart';

/// Base class for a micro application.
///
/// Subclasses of [MicroApp] define a modular part of the application,
/// encapsulating its own routes and dependency injection configuration.
abstract class MicroApp {
  /// Returns the name of the micro application.
  ///
  /// It represents the identifier or label of the micro application.
  String get microAppName;

  /// Returns the dependency injection configuration for the micro application.
  ///
  /// It specifies the injections to be registered for the micro application.
  AutoInjector get injectionsRegister;

  /// Returns a list of routes specific to the micro application.
  ///
  /// These routes will be included in the route configuration of the parent
  /// application.
  List<RouteBase> get routes;
}
