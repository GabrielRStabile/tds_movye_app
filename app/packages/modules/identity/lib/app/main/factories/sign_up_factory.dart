import 'package:identity/app/domain/use_cases/sign_up_use_case.dart';
import 'package:identity/app/providers/auth_provider.dart';

class SignUpFactory extends SignUpUseCase {
  SignUpFactory() : super(signUpData: AuthProvider());
}
