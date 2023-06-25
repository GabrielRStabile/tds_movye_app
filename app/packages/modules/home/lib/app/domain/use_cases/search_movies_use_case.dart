import 'package:core/app/utils/use_case.dart';
import 'package:home/app/domain/data/iget_movie_by_keyword_data.dart';
import 'package:home/app/domain/entities/movie_entity.dart';

class SearchMoviesUseCase extends UseCase<List<MovieEntity>, String> {
  SearchMoviesUseCase(IGetMovieByKeywordData data)
      : _getMovieByKeywordData = data;

  final IGetMovieByKeywordData _getMovieByKeywordData;

  @override
  Future<List<MovieEntity>> call(String params) {
    return _getMovieByKeywordData.search(params);
  }
}
