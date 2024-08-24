
import 'package:app_flutter/core/network/api_service.dart';
import 'package:app_flutter/features/auth/data/models/user_model.dart';

import '../models/auth_response_model.dart';
import '../repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService apiService;

  AuthRepositoryImpl(this.apiService);

  @override
  Future<AuthResponseModel> login(String username, String password) {
    return apiService.login(username, password);
  }

  @override
  Future<AuthResponseModel> register(String username, String email, String password) {
    return apiService.register(username, email, password);
  }

  @override
  Future<void> forgotPassword(String email) {
    return apiService.forgotPassword(email);
  }

  @override
  Future<UserModel> getUserInfo(String userId) {
    return apiService.getUserInfo(userId);
  }
}
