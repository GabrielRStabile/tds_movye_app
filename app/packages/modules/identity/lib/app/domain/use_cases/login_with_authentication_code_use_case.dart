import 'package:core/app/utils/use_case.dart';

import 'package:identity/app/domain/data/isign_in_data.dart';

class LoginWithAuthenticationCodeUseCase
    extends UseCase<SignInResponse, SignInRequest> {
  LoginWithAuthenticationCodeUseCase({
    required this.signInData,
  });

  final ISignInData signInData;

  @override
  Future<SignInResponse> call(SignInRequest params) async {
    return signInData.signIn(
      params,
    );
  }
}
