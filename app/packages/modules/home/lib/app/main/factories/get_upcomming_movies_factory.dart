import 'package:home/app/domain/use_cases/get_upcomming_movies_use_case.dart';
import 'package:home/app/providers/movies_provider.dart';

class GetUpcommingMoviesFactory extends GetUpcommingMoviesUseCase {
  GetUpcommingMoviesFactory() : super(MoviesProvider());
}
