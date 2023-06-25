import 'package:core/app/utils/use_case.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/app/domain/entities/movie_entity.dart';
import 'package:home/app/main/factories/get_upcomming_movies_factory.dart';

import 'package:home/app/ui/pages/home_page/molecules/upcomming_movies_carousel_molecule.dart';

class UpcommingMoviesCarouselMoleculeBuilder extends StatefulWidget {
  const UpcommingMoviesCarouselMoleculeBuilder({super.key});

  @override
  State<UpcommingMoviesCarouselMoleculeBuilder> createState() =>
      _UpcommingMoviesCarouselMoleculeBuilderState();
}

class _UpcommingMoviesCarouselMoleculeBuilderState
    extends State<UpcommingMoviesCarouselMoleculeBuilder> {
  late final Future<List<MovieEntity>> getUpcommingMovies;

  @override
  void initState() {
    super.initState();
    getUpcommingMovies = GetUpcommingMoviesFactory().call(NoParams());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieEntity>>(
      future: getUpcommingMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return UpcommingMoviesCarouselMolecule(
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
