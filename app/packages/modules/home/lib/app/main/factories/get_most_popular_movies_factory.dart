import 'package:home/app/domain/use_cases/get_most_popular_movies_use_case.dart';
import 'package:home/app/providers/movies_provider.dart';

class GetMostPopularMoviesFactory extends GetMostPopularMoviesUseCase {
  GetMostPopularMoviesFactory() : super(MoviesProvider());
}
