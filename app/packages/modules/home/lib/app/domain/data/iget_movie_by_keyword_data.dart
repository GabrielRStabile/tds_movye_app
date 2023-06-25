import 'package:home/app/domain/entities/movie_entity.dart';

abstract class IGetMovieByKeywordData {
  Future<List<MovieEntity>> search(String keyword);
}
