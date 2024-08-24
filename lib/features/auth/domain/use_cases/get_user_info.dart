import 'package:app_flutter/features/auth/data/models/user_model.dart';
import 'package:app_flutter/features/auth/data/repositories/auth_repository.dart';


class GetUserInfo {
  final AuthRepository repository;

  GetUserInfo(this.repository);

  Future<UserModel> execute(String userId) {
    return repository.getUserInfo(userId);
  }
}
