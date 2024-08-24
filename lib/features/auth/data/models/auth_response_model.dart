import 'package:app_flutter/features/auth/data/models/user_model.dart';

class AuthResponseModel {
  final UserModel user;
  final String token;

  AuthResponseModel({required this.user, required this.token});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      user: UserModel.fromJson(json['user']),
      token: json['token'],
    );
  }
}
