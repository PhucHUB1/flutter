import 'package:flutter/material.dart';
import '../widgets/forgot_password_form.dart';


class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: ForgotPasswordForm(),
    );
  }
}
