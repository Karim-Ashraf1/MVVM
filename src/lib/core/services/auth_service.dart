class AuthService {
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email == "karim@gmail.com" && password == "12345678") {
      return true;
    }
    return false;
  }
}
