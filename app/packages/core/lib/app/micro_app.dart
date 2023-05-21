import 'package:dependencies/dependencies.dart';

abstract class MicroApp {
  String get microAppName;

  AutoInjector get injectionsRegister;

  List<RouteBase> get routes;
}
