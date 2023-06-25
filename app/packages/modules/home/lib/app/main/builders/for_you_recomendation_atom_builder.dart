import 'package:core/app/utils/use_case.dart';
import 'package:flutter/material.dart';
import 'package:home/app/domain/entities/movie_entity.dart';
import 'package:home/app/main/factories/get_most_popular_movies_factory.dart';
import 'package:home/app/ui/pages/home_page/atoms/cover_film_atom.dart';

class ForYouRecomendationAtomBuilder extends StatefulWidget {
  const ForYouRecomendationAtomBuilder({super.key});

  @override
  State<ForYouRecomendationAtomBuilder> createState() =>
      _ForYouRecomendationAtomBuilderState();
}

class _ForYouRecomendationAtomBuilderState
    extends State<ForYouRecomendationAtomBuilder> {
  late final Future<List<MovieEntity>> getRecomendationMovie;

  @override
  void initState() {
    super.initState();
    getRecomendationMovie = GetMostPopularMoviesFactory().call(NoParams());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieEntity>>(
      future: getRecomendationMovie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final movie = (snapshot.data!..shuffle()).first;

          return CoverFilmAtom(
            coverUrl: movie.coverImage,
            filmTitle: movie.title,
            tagLabel: movie.voteAverage.toString(),
            width: double.infinity,
            onTap: () {},
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
