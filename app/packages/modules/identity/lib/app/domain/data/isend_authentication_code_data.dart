abstract class ISendAuthenticationCodeData {
  Future<void> send(String email);
}
