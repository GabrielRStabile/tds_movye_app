import 'package:core/app/utils/use_case.dart';
import 'package:home/app/domain/data/iget_movie_videos_data.dart';
import 'package:home/app/domain/entities/movie_video_entity.dart';

class GetMovieVideosUseCase extends UseCase<List<MovieVideoEntity>, int> {
  GetMovieVideosUseCase(IGetMovieVideosData getMovieVideosData)
      : _getMovieVideosData = getMovieVideosData;

  final IGetMovieVideosData _getMovieVideosData;

  @override
  Future<List<MovieVideoEntity>> call(int params) {
    return _getMovieVideosData.getMovieVideos(params);
  }
}
