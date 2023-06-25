import 'package:core/app/utils/use_case.dart';
import 'package:home/app/domain/data/iget_movie_details_data.dart';
import 'package:home/app/domain/entities/movie_details_entity.dart';

class GetMovieDetailsUseCase extends UseCase<MovieDetailsEntity, int> {
  GetMovieDetailsUseCase(
    IGetMovieDetailsData getMovieDetailsData,
  ) : _getMovieDetailsData = getMovieDetailsData;

  final IGetMovieDetailsData _getMovieDetailsData;
  @override
  Future<MovieDetailsEntity> call(int params) async {
    return _getMovieDetailsData.getMovieDetails(params);
  }
}
