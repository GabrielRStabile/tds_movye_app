// ignore_for_file: cast_nullable_to_non_nullable

import 'package:core/app/micro_app.dart';
import 'package:core/app/ui/pages/dialog_page.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/app/domain/entities/movie_entity.dart';
import 'package:home/app/ui/pages/home_page/home_page.dart';
import 'package:home/app/ui/pages/movie_details_page/movie_details_page.dart';
import 'package:home/app/ui/pages/search_page/search_page.dart';
import 'package:home/app/ui/shared/organisms/home_scaffold_organism.dart';

class HomeModuleResolver implements MicroApp {
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  @override
  String get microAppName => 'home';

  @override
  List<RouteBase> get routes => [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state, child) {
            return NoTransitionPage(
              child: HomeScaffoldOrganism(
                child: child,
              ),
            );
          },
          routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: '/home',
              builder: (_, __) => const HomePage(),
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: '/search',
              builder: (_, __) => const SearchPage(),
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: '/details',
              pageBuilder: (_, state) => ModalBottomSheetPage(
                builder: (_) =>
                    MovieDetailsPage(movie: state.extra as MovieEntity),
              ),
            ),
          ],
        ),
      ];

  @override
  AutoInjector get injectionsRegister => AutoInjector(
        tag: microAppName,
        on: (injector) {},
      );
}
