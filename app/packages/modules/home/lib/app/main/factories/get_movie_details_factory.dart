import 'package:home/app/domain/use_cases/get_movie_details_use_case.dart';

import 'package:home/app/providers/movies_provider.dart';

class GetMovieDetailsFactory extends GetMovieDetailsUseCase {
  GetMovieDetailsFactory() : super(MoviesProvider());
}
