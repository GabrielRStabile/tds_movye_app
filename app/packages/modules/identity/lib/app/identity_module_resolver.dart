import 'package:core/app/micro_app.dart';
import 'package:dependencies/dependencies.dart';
import 'package:identity/app/services/protocols/iauthentication_store.dart';
import 'package:identity/app/services/stores/authentication_store.dart';
import 'package:identity/app/ui/pages/authentication_page/authentication_page.dart';

class IdentityModuleResolver implements MicroApp {
  @override
  String get microAppName => 'identity';

  @override
  List<RouteBase> get routes => [
        GoRoute(
          path: '/auth',
          builder: (_, __) => const AuthenticationPage(),
        ),
      ];

  @override
  AutoInjector get injectionsRegister => AutoInjector(
        tag: microAppName,
        on: (injector) {
          injector
              .addLazySingleton<IAuthenticationStore>(AuthenticationStore.new);
        },
      );
}
