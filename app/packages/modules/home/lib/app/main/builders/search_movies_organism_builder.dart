import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/app/domain/entities/movie_entity.dart';
import 'package:home/app/main/builders/popular_movies_carousel_molecule_builder.dart';
import 'package:home/app/main/factories/search_movies_factory.dart';
import 'package:home/app/ui/pages/home_page/atoms/cover_film_atom.dart';
import 'package:home/app/ui/pages/home_page/atoms/section_title_atom.dart';

class SearchMoviesOrganismBuilder extends StatefulWidget {
  const SearchMoviesOrganismBuilder({required this.searchQuery, super.key});
  final String searchQuery;

  @override
  State<SearchMoviesOrganismBuilder> createState() =>
      _SearchMoviesOrganismBuilderState();
}

class _SearchMoviesOrganismBuilderState
    extends State<SearchMoviesOrganismBuilder> {
  @override
  Widget build(BuildContext context) {
    if (widget.searchQuery.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionTitleAtom(
            boldPart: 'Veja essas',
            normalPart: ' recomendações',
          ),
          SizedBox(height: 12),
          PopularMoviesCarouselMoleculeBuilder(),
        ],
      );
    } else {
      return FutureBuilder<List<MovieEntity>>(
        future: SearchMoviesFactory().call(widget.searchQuery),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final movies = snapshot.data!;
            return SizedBox(
              height: 1000,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CoverFilmAtom(
                          width: MediaQuery.of(context).size.width * 0.95,
                          coverUrl: movies[index].coverImage,
                          filmTitle: movies[index].title,
                          tagLabel: '#${index + 1}',
                          onTap: () =>
                              context.push('/details', extra: movies[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
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
}
