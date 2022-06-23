import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  Register({required this.toggleview});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text('Sign up to brew crew'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
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
                  child: Text('Register'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() => error = 'please supply a valid email');
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            )),
      ),
    );
  }
}
