import 'package:core/app/utils/use_case.dart';

import 'package:identity/app/domain/data/isign_up_data.dart';

class SignUpUseCase extends UseCase<void, SignUpRequest> {
  SignUpUseCase({
    required this.signUpData,
  });

  final ISignUpData signUpData;

  @override
  Future<void> call(SignUpRequest params) async {
    await signUpData.signUp(
      params,
    );
  }
}
