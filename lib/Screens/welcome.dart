import 'package:app_flutter/Screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    String? _email = _auth.currentUser!.email;
    return Scaffold(
      appBar: AppBar(
        title: Text("Dasboard"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Logged In With: $_email"),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: (){
                      _auth.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                        ));
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Log Out Success')));
                   },
                child: Text("Sign Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
