import 'package:flutter/material.dart';
import 'authenticate/authenticate.dart';
import 'home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Home();
          } else {
            return Authenticate();
          }
        }
        return Authenticate();
      },
    );
  }
}
