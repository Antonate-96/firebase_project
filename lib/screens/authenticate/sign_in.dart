import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleview;
  SignIn({required this.toggleview});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Authservice _auth = Authservice();
  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Sign in to brew crew'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toggleview();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
            child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            TextFormField(
              onChanged: ((value) {
                setState(() => email = value);
              }),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              onChanged: ((value) {
                setState(() => password = value);
              }),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Sign in'),
              onPressed: () async {
                print(email);
                print(password);
              },
            )
          ],
        )),
      ),
    );
  }
}
