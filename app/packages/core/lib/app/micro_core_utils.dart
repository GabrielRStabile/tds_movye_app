import 'package:dependencies/dependencies.dart';
import 'package:flutter/widgets.dart';

/// Global key for accessing the navigator state.
///
/// The [navigatorKey] is a [GlobalKey] instance that provides access to the
/// [NavigatorState].
/// It can be used to perform navigation actions, such as pushing or popping
/// routes, from anywhere within the application.
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// The auto injector instance for dependency injection.
///
/// The [autoInjector] is an [AutoInjector] instance that allows registering and
/// managing dependencies within the application. It is typically used to
/// configure and initialize the dependency injection container.
late AutoInjector autoInjector;
