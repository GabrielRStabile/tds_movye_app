import 'package:core/app/micro_app.dart';
import 'package:dependencies/dependencies.dart';

class IdentityModuleResolver implements MicroApp {
  @override
  String get microAppName => 'identity';

  @override
  List<RouteBase> get routes => [];

  @override
  AutoInjector get injectionsRegister => AutoInjector(
        tag: microAppName,
        on: (injector) {},
      );
}
