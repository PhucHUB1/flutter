import 'package:app_flutter/features/auth/data/repositories/auth_repository.dart';


class ForgotPassword {
  final AuthRepository repository;

  ForgotPassword(this.repository);

  Future<void> execute(String email) {
    return repository.forgotPassword(email);
  }
}
