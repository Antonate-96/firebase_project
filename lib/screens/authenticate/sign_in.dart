import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Authservice _auth = Authservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0.0,
        title: Text('Sign in to brew crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(
          child: Text('Sign in anon'),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print('error sign in');
            } else {
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
