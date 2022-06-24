import 'package:firebase_app/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    brews.forEach((brews) {
      print(brews.name);
      print(brews.sugars);
      print(brews.Strength);
    });

    return Container();
  }
}
