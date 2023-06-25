import 'package:home/app/domain/use_cases/get_movie_videos_use_case.dart';

import 'package:home/app/providers/movies_provider.dart';

class GetMovieVideosFactory extends GetMovieVideosUseCase {
  GetMovieVideosFactory() : super(MoviesProvider());
}
