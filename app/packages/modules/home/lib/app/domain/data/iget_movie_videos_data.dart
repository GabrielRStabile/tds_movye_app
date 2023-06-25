import 'package:home/app/domain/entities/movie_video_entity.dart';

abstract class IGetMovieVideosData {
  Future<List<MovieVideoEntity>> getMovieVideos(int movieId);
}
