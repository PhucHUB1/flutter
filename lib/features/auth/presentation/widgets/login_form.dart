import 'package:app_flutter/core/network/api_service.dart';
import 'package:app_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:app_flutter/features/auth/domain/use_cases/login_user.dart';
import 'package:flutter/material.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    final apiService = ApiService('https://dummyjson.com');
    final authRepository = AuthRepositoryImpl(apiService);
    final loginUser = LoginUser(authRepository);

    try {
      final response = await loginUser.execute(
        _usernameController.text,
        _passwordController.text,
      );
      // Điều hướng đến UserProfilePage với tham số userId
      Navigator.pushNamed(
        context,
        '/user-profile',
        arguments: {'userId': response.user.id},
      );
    } catch (e) {
      // Xử lý lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng nhập thất bại: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Tên đăng nhập'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Mật khẩu'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          _isLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
            onPressed: _login,
            child: Text('Đăng Nhập'),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text('Chưa có tài khoản? Đăng ký ngay!'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/forgot-password');
            },
            child: Text('Quên mật khẩu?'),
          ),
        ],
      ),
    );
  }
}
