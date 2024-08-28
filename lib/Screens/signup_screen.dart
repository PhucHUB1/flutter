import 'package:app_flutter/Screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  String _email = "";
  String _password = "";
  void _handleSignUp()async{
    try{
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,);
      print("User Register :${userCredential.user!.email}");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),

          ));
    }catch(e){
      print("Error During Registration: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
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
                        _handleSignUp();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Sign Up Success')));
                    }
                  },
                  child: Text("Sign Up"),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
