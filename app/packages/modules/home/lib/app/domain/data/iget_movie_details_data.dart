import 'package:home/app/domain/entities/movie_details_entity.dart';

abstract class IGetMovieDetailsData {
  Future<MovieDetailsEntity> getMovieDetails(int movieId);
}
