import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/brew.dart';
import 'package:firebase_app/screens/home/brew_list.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final Authservice _auth = Authservice();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      initialData: [],
      value: DatabaseService().brews,
      child: Scaffold(
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
        body: BrewList(),
      ),
    );
  }
}
