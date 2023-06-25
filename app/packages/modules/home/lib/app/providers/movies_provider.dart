import 'package:core/app/micro_core_utils.dart';
import 'package:core/app/utils/api_caller_util.dart';
import 'package:home/app/domain/data/iget_most_popular_movies_data.dart';
import 'package:home/app/domain/data/iget_movie_details_data.dart';
import 'package:home/app/domain/data/iget_movie_videos_data.dart';
import 'package:home/app/domain/data/iget_upcomming_movies_data.dart';
import 'package:home/app/domain/entities/movie_details_entity.dart';
import 'package:home/app/domain/entities/movie_entity.dart';
import 'package:home/app/domain/entities/movie_video_entity.dart';

import 'package:home/app/domain/data/iget_movie_by_keyword_data.dart';

class MoviesProvider
    implements
        IGetMostPopularMoviesData,
        IGetUpcommingMoviesData,
        IGetMovieDetailsData,
        IGetMovieVideosData,
        IGetMovieByKeywordData {
  final _caller = autoInjector.get<ApiCallerUtil>();

  @override
  Future<List<MovieEntity>> getMostPopularMovies() async {
    final response = await _caller.api.get<Map<String, dynamic>>(
      '/v1/movie/popular',
    );

    final movies = response.data?['movies'] as List<dynamic>;

    return movies
        .map((movie) => MovieEntity.fromMap(movie as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<MovieEntity>> getUpcommingMovies() async {
    final response = await _caller.api.get<Map<String, dynamic>>(
      '/v1/movie/upcomming',
    );

    final movies = response.data?['movies'] as List<dynamic>;

    return movies
        .map((movie) => MovieEntity.fromMap(movie as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<MovieDetailsEntity> getMovieDetails(int movieId) async {
    final response = await _caller.api.get<Map<String, dynamic>>(
      '/v1/movie/$movieId',
    );

    return MovieDetailsEntity.fromMap(
      response.data?['movieDetails'] as Map<String, dynamic>,
    );
  }

  @override
  Future<List<MovieVideoEntity>> getMovieVideos(int movieId) async {
    final response = await _caller.api.get<Map<String, dynamic>>(
      '/v1/movie/$movieId/videos',
    );

    final videos = response.data?['movieVideos'] as List<dynamic>;

    return videos
        .map((movie) => MovieVideoEntity.fromMap(movie as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<MovieEntity>> search(String keyword) async {
    final response = await _caller.api.get<Map<String, dynamic>>(
      '/v1/movie/search',
      queryParameters: {
        'query': keyword,
      },
    );

    final movies = response.data?['movies'] as List<dynamic>;

    return movies
        .map((movie) => MovieEntity.fromMap(movie as Map<String, dynamic>))
        .toList();
  }
}
