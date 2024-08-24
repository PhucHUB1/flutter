import 'package:app_flutter/features/auth/data/models/auth_response_model.dart';
import 'package:app_flutter/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<AuthResponseModel> register(String username, String email, String password);
  Future<AuthResponseModel> login(String username, String password);
  Future<void> forgotPassword(String email);
  Future<UserModel> getUserInfo(String id);
}
