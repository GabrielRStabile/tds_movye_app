import 'package:identity/app/domain/use_cases/login_with_authentication_code_use_case.dart';
import 'package:identity/app/providers/auth_provider.dart';

class LoginWithAuthenticationCodeFactory
    extends LoginWithAuthenticationCodeUseCase {
  LoginWithAuthenticationCodeFactory() : super(signInData: AuthProvider());
}
