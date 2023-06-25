import 'package:core/app/utils/use_case.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/app/domain/entities/movie_entity.dart';
import 'package:home/app/main/factories/get_most_popular_movies_factory.dart';

import 'package:home/app/ui/pages/home_page/molecules/popular_movies_carousel_molecule.dart';

class PopularMoviesCarouselMoleculeBuilder extends StatefulWidget {
  const PopularMoviesCarouselMoleculeBuilder({super.key});

  @override
  State<PopularMoviesCarouselMoleculeBuilder> createState() =>
      _PopularMoviesCarouselMoleculeBuilderState();
}

class _PopularMoviesCarouselMoleculeBuilderState
    extends State<PopularMoviesCarouselMoleculeBuilder> {
  late final Future<List<MovieEntity>> getPopularMovies;

  @override
  void initState() {
    super.initState();
    getPopularMovies = GetMostPopularMoviesFactory().call(NoParams());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieEntity>>(
      future: getPopularMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PopularMoviesCarouselMolecule(
            movies: snapshot.data!,
            onTap: (movie) {
              context.push('/details', extra: movie);
            },
          );
        } else if (snapshot.hasError) {
          return const SizedBox.shrink();
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
