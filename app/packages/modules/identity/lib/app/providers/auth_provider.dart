import 'package:dependencies/dependencies.dart';
import 'package:identity/app/domain/data/isend_authentication_code_data.dart';
import 'package:identity/app/domain/data/isign_in_data.dart';

import 'package:identity/app/domain/data/isign_up_data.dart';

class AuthProvider
    implements ISendAuthenticationCodeData, ISignUpData, ISignInData {
  Dio api = Dio(
    BaseOptions(baseUrl: '${dotenv.env['MOVYE-API-URL']}/v1/auth'),
  );

  @override
  Future<void> send(String email) async {
    await api.post<void>(
      '/token',
      data: {'email': email},
    );
  }

  @override
  Future<void> signUp(SignUpRequest request) async {
    final birthDate = DateFormat('yyyy-MM-dd').format(request.birthDate);
    await api.post<void>(
      '/signup',
      data: {
        'userName': request.userName,
        'email': request.email,
        'birthDate': birthDate,
      },
    );
  }

  @override
  Future<SignInResponse> signIn(SignInRequest request) async {
    final response = await api.post<Map<String, dynamic>>(
      '/signin',
      data: {
        'email': request.email,
        'token': request.authCode,
      },
    );

    return SignInResponse.fromJson(response.data!);
  }
}
