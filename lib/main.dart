import 'package:firebase_app/firebase_options.dart';
import 'package:firebase_app/models/user.dart';
import 'package:firebase_app/screens/authenticate/authenticate.dart';
import 'package:firebase_app/screens/home/home.dart';
import 'package:firebase_app/screens/wrapper.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: Authservice().user,
      child: MaterialApp(
        theme: ThemeData(
          // Define the default colors.
          primaryColor: Colors.brown[400],
          backgroundColor: Colors.brown[50],
          appBarTheme: AppBarTheme(
            color: Colors.brown[400],
          ),
        ),
        home: Wrapper(),
      ),
    );
  }
}
