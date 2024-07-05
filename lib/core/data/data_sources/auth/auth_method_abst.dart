abstract class AuthMethod {
  bool get isLoggedIn;

  Future<bool> login();
  Future<void> logout();
}
