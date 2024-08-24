import 'package:app_flutter/core/network/api_service.dart';
import 'package:app_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:app_flutter/features/auth/domain/use_cases/forgot_password.dart';
import 'package:flutter/material.dart';


class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _emailController = TextEditingController();
  bool _isLoading = false;

  void _forgotPassword() async {
    setState(() {
      _isLoading = true;
    });
    final apiService = ApiService('https://dummyjson.com');
    final authRepository = AuthRepositoryImpl(apiService);
    final forgotPassword = ForgotPassword(authRepository);

    try {
      await forgotPassword.execute(_emailController.text);
      // Hiển thị thông báo thành công
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đã gửi liên kết đặt lại mật khẩu')),
      );
    } catch (e) {
      // Xử lý lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gửi liên kết đặt lại mật khẩu thất bại: $e')),
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
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 20),
          _isLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
            onPressed: _forgotPassword,
            child: Text('Gửi Liên Kết Đặt Lại Mật Khẩu'),
          ),
        ],
      ),
    );
  }
}
