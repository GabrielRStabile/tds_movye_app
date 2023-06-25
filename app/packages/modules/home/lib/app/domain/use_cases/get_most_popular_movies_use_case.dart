import 'package:core/app/utils/use_case.dart';
import 'package:home/app/domain/data/iget_most_popular_movies_data.dart';
import 'package:home/app/domain/entities/movie_entity.dart';

class GetMostPopularMoviesUseCase extends UseCase<List<MovieEntity>, NoParams> {
  GetMostPopularMoviesUseCase(
    IGetMostPopularMoviesData getMostPopularMoviesData,
  ) : _getMostPopularMoviesData = getMostPopularMoviesData;

  final IGetMostPopularMoviesData _getMostPopularMoviesData;

  @override
  Future<List<MovieEntity>> call(NoParams params) {
    return _getMostPopularMoviesData.getMostPopularMovies();
  }
}
