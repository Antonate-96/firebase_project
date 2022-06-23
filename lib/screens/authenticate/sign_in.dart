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
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

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
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  validator: ((value) =>
                      value!.isEmpty ? 'Enter an Email' : null),
                  onChanged: ((value) {
                    setState(() => email = value);
                  }),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: ((value) => value!.length < 6
                      ? 'Enter a Password 6 chars long'
                      : null),
                  obscureText: true,
                  onChanged: ((value) {
                    setState(() => password = value);
                  }),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text('Sign in'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print('valid');
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() =>
                            error = 'COULD NOT SIGN IN WITH THOSE CREDENTIALS');
                      }
                    }
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            )),
      ),
    );
  }
}
