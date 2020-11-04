import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallnut_money_manager/models/user.dart';
import 'package:wallnut_money_manager/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  Userwallnut _userFromFirebaseUser(User user) {
    if (user != null) {
      return Userwallnut(uid: user.uid);
    } else {
      return null;
    }
  }

  Future<String> getCurrentUser() async {
    return (_auth.currentUser.email);
  }

  //sign in with with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user;
      //create a new document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData(name, email, password, 0, 0, 0);
      return _userFromFirebaseUser(user);
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
