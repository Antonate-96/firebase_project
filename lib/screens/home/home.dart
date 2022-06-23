import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Authservice _auth = Authservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Brew Crew'),
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black)),
            icon: const Icon(Icons.person),
            label: Text('log out'),
            onPressed: () async {
              await _auth.signout();
            },
          )
        ],
      ),
    );
  }
}
