import 'package:app_flutter/features/auth/data/models/auth_response_model.dart';
import 'package:app_flutter/features/auth/data/repositories/auth_repository.dart';


class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<AuthResponseModel> execute(String username, String password) {
    return repository.login(username, password);
  }
}
