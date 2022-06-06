import 'package:firebase_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Authservice {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj bases on firebaseuser
  MyUser? _userfromfirebaseUser(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //sign in anonymouse
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userfromfirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & pass

  //regist email

  //sign out

}
