import 'package:home/app/domain/entities/movie_entity.dart';

abstract class IGetUpcommingMoviesData {
  Future<List<MovieEntity>> getUpcommingMovies();
}
