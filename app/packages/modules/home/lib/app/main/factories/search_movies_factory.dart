import 'package:home/app/domain/use_cases/search_movies_use_case.dart';
import 'package:home/app/providers/movies_provider.dart';

class SearchMoviesFactory extends SearchMoviesUseCase {
  SearchMoviesFactory()
      : super(
          MoviesProvider(),
        );
}
