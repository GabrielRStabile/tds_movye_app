class SignUpRequest {
  SignUpRequest({
    required this.userName,
    required this.email,
    required this.birthDate,
  });

  final String userName;
  final String email;
  final DateTime birthDate;
}

abstract class ISignUpData {
  Future<void> signUp(SignUpRequest request);
}
