import 'package:flutter/material.dart';
import 'package:home/app/domain/entities/movie_entity.dart';

import 'package:home/app/ui/pages/home_page/atoms/cover_film_atom.dart';

class PopularMoviesCarouselMolecule extends StatelessWidget {
  const PopularMoviesCarouselMolecule({
    required this.movies,
    required this.onTap,
    super.key,
  });

  final List<MovieEntity> movies;
  final void Function(MovieEntity) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: PageView.builder(
        controller: PageController(
          viewportFraction: 0.35,
        ),
        itemCount: movies.length,
        padEnds: false,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CoverFilmAtom(
              coverUrl: movies[index].posterImage,
              filmTitle: movies[index].title,
              tagLabel: '#${index + 1}',
              onTap: () => onTap(movies[index]),
            ),
          );
        },
      ),
    );
  }
}
