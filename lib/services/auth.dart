import 'package:firebase_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Authservice {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj bases on firebaseuser
  MyUser? _userfromfirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userfromfirebaseUser(user));
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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userfromfirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //regist email & pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userfromfirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
