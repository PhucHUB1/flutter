import 'package:app_flutter/core/network/api_service.dart';
import 'package:app_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:app_flutter/features/auth/domain/use_cases/register_user.dart';
import 'package:flutter/material.dart';


class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    final apiService = ApiService('https://dummyjson.com');
    final authRepository = AuthRepositoryImpl(apiService);
    final registerUser = RegisterUser(authRepository);

    try {
      final response = await registerUser.execute(
        _usernameController.text,
        _emailController.text,
        _passwordController.text,
      );

      Navigator.pushNamed(
        context,
        '/user-profile',
        arguments: {'userId': response.user.id},
      );
    } catch (e) {
      print('Error: $e');  // In ra lỗi chi tiết
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng ký thất bại: $e')),
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
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
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
            onPressed: _register,
            child: Text('Đăng Ký'),
          ),
        ],
      ),
    );
  }
}
