import 'package:flutter/material.dart';
import '../widgets/user_profile_info.dart';


class UserProfilePage extends StatelessWidget {
  final String userId;

  UserProfilePage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: UserProfileInfo(userId: userId),
    );
  }
}
