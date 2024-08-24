import 'package:flutter/material.dart';
import '../widgets/registration_form.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: RegistrationForm(),
    );
  }
}
