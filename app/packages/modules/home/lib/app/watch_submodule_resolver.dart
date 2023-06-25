// ignore_for_file: cast_nullable_to_non_nullable

import 'package:core/app/micro_app.dart';
import 'package:core/app/micro_core_utils.dart';
import 'package:dependencies/dependencies.dart';
import 'package:home/app/main/builders/watch_movie_page_builder.dart';

class WatchSubmoduleResolver implements MicroApp {
  @override
  String get microAppName => 'watch';

  @override
  List<RouteBase> get routes => [
        GoRoute(
          parentNavigatorKey: navigatorKey,
          path: '/watch/:movieId',
          builder: (_, state) => WatchMoviePageBuilder(
            movieId: int.parse(state.pathParameters['movieId']!),
            movieName: state.queryParameters['movieName']!,
          ),
        ),
      ];

  @override
  AutoInjector get injectionsRegister => AutoInjector(
        tag: microAppName,
        on: (injector) {},
      );
}
