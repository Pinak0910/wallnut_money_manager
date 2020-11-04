import 'package:flutter/material.dart';
import 'package:wallnut_money_manager/first.dart';
import 'screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.hasError.toString());
          return Text(snapshot.hasError.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
       return new Directionality( textDirection: TextDirection.ltr, child: Loading());
      },
    );
  }
}
