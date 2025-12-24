import 'package:flutter_test/flutter_test.dart';
import 'package:src/features/login/view_model/login_view_model.dart';
import 'package:src/features/login/model/user_model.dart';

void main() {
  test('Login with correct credentials should succeed', () async {
    final viewModel = LoginViewModel();
    final user = UserModel(email: 'karim@gmail.com', password: '12345678');

    final result = await viewModel.login(user);

    expect(result, true);
    expect(viewModel.errorMessage, null);
    expect(viewModel.isLoading, false);
  });

  test('Login with wrong credentials should fail', () async {
    final viewModel = LoginViewModel();
    final user = UserModel(email: 'wrong@gmail.com', password: 'wrong');

    final result = await viewModel.login(user);

    expect(result, false);
    expect(viewModel.errorMessage, 'Invalid email or password');
    expect(viewModel.isLoading, false);
  });

  test('Login should set loading state correctly', () async {
    final viewModel = LoginViewModel();
    final user = UserModel(email: 'karim@gmail.com', password: '12345678');

    expect(viewModel.isLoading, false);

    final loginFuture = viewModel.login(user);

    await loginFuture;

    expect(viewModel.isLoading, false);
  });
}
