class SignInRequest {
  SignInRequest({
    required this.authCode,
    required this.email,
  });

  final String authCode;
  final String email;
}

class SignInResponse {
  SignInResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      accessToken: json['accessToken'].toString(),
      refreshToken: json['refreshToken'].toString(),
    );
  }

  final String accessToken;
  final String refreshToken;
}

abstract class ISignInData {
  Future<SignInResponse> signIn(SignInRequest request);
}
