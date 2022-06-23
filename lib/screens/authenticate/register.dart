import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Authservice _auth = Authservice();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Sign to brew crew'),
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
              child: Text('Register'),
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