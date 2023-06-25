abstract class UseCase<Respose, Params> {
  Future<Respose> call(Params params);
}

class NoParams {}
