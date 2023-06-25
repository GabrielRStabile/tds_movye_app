import 'package:home/app/domain/entities/movie_entity.dart';

abstract class IGetMostPopularMoviesData {
  Future<List<MovieEntity>> getMostPopularMovies();
}
