import 'package:flutter/material.dart';
import '../../../core/services/auth_service.dart';
import '../model/user_model.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;
  String? errorMessage;

  Future<bool> login(UserModel user) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _authService.login(user.email, user.password);

    isLoading = false;

    if (!result) {
      errorMessage = "Invalid email or password";
    }

    notifyListeners();
    return result;
  }
}
