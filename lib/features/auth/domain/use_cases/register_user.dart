import 'package:app_flutter/features/auth/data/models/auth_response_model.dart';
import 'package:app_flutter/features/auth/data/repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<AuthResponseModel> execute(String username, String email, String password) {
    return repository.register(username, email, password);
  }
}
