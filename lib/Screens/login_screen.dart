import 'package:app_flutter/Screens/signup_screen.dart';
import 'package:app_flutter/Screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  String _email = "";
  String _password = "";
  void _handleLogin()async{
    try{
      UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,);
      print("User Logged In :${userCredential.user!.email}");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Welcome(),
          ));
    }catch(e){
      print("Error During Logged In : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please Enter Your Email";
                    }
                    return null;
                  },
                  onChanged: (value){
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please Enter Your Password";
                    }
                    if(value.length < 6){
                      return "Password must be at least 6 character";
                    }
                    return null;
                  },
                  onChanged: (value){
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      _handleLogin();
                    }
                  },
                  child: Text("Login"),

                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ));
                  },
                  child: Text('Chưa có tài khoản? Đăng ký ngay!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
