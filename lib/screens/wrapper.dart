import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnut_money_manager/models/user.dart';
import 'package:wallnut_money_manager/screens/authentication/authenticate.dart';
import 'package:wallnut_money_manager/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
