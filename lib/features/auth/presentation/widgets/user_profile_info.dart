import 'package:app_flutter/core/network/api_service.dart';
import 'package:app_flutter/features/auth/data/models/user_model.dart';
import 'package:app_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:app_flutter/features/auth/domain/use_cases/get_user_info.dart';
import 'package:flutter/material.dart';


class UserProfileInfo extends StatefulWidget {
  final String userId;

  UserProfileInfo({required this.userId});

  @override
  _UserProfileInfoState createState() => _UserProfileInfoState();
}

class _UserProfileInfoState extends State<UserProfileInfo> {
  late Future<UserModel> _userInfo;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    final apiService = ApiService('https://dummyjson.com');
    final authRepository = AuthRepositoryImpl(apiService);
    final getUserInfo = GetUserInfo(authRepository);

    _userInfo = getUserInfo.execute(widget.userId);
    _userInfo.whenComplete(() => setState(() {
      _isLoading = false;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : FutureBuilder<UserModel>(
      future: _userInfo,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Lỗi: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final user = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tên người dùng: ${user.username}', style: TextStyle(fontSize: 18)),
                Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        } else {
          return Center(child: Text('Không có dữ liệu'));
        }
      },
    );
  }
}
