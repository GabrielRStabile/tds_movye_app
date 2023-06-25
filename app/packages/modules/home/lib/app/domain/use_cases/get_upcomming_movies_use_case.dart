import 'package:core/app/utils/use_case.dart';

import 'package:home/app/domain/data/iget_upcomming_movies_data.dart';
import 'package:home/app/domain/entities/movie_entity.dart';

class GetUpcommingMoviesUseCase extends UseCase<List<MovieEntity>, NoParams> {
  GetUpcommingMoviesUseCase(
    IGetUpcommingMoviesData getUpcommingMoviesData,
  ) : _getUpcommingMoviesData = getUpcommingMoviesData;

  final IGetUpcommingMoviesData _getUpcommingMoviesData;

  @override
  Future<List<MovieEntity>> call(NoParams params) {
    return _getUpcommingMoviesData.getUpcommingMovies();
  }
}
