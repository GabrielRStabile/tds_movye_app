import 'package:identity/app/domain/use_cases/send_authentication_code_use_case.dart';
import 'package:identity/app/providers/auth_provider.dart';

class SendAuthenticationCodeFactory extends SendAuthenticationCodeUseCase {
  SendAuthenticationCodeFactory()
      : super(sendAuthenticationCodeData: AuthProvider());
}
