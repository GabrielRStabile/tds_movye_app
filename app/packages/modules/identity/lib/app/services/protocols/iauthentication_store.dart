abstract class IAuthenticationStore {
  Future<void> sendAuthenticationCode(String email);
  Future<bool> signInWithAuthenticationCode(String code);
  Future<void> signOut();
  Future<void> registerWithEmail(
    String email,
    DateTime birthDate,
    String userName,
  );
  String get email;
  set email(String email);
}
