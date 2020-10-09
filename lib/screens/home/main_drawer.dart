import 'package:flutter/material.dart';
import 'package:wallnut_money_manager/services/auth.dart';

class MainDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400],
        ),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.vertical(
                      top: Radius.zero, bottom: Radius.circular(30.0))),
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 30.0, bottom: 0.0),
                      width: 125,
                      height: 125,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Colors.white,
                              width: 3.0,
                              style: BorderStyle.solid),
                          image: DecorationImage(
                            image: AssetImage('assets/profile.png'),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'Wallnut Team',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'wallnut@gmail.com',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              focusColor: Colors.grey[900],
              hoverColor: Colors.grey[900],
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: null,
            ),
            ListTile(
              focusColor: Colors.grey[800],
              hoverColor: Colors.grey[800],
              leading: Icon(
                Icons.clear_all,
                color: Colors.black,
              ),
              title: Text(
                'Clear data',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail, color: Colors.black),
              title: Text(
                "About Us",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => new AlertDialog(
                          backgroundColor: Colors.white,
                          shape: BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(20, 10))),
                          title: new Text(
                            "About us",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Container(
                            width: double.infinity,
                            height: 78,
                            child: Column(
                              children: <Widget>[
                                Row(children: [
                                  Text("Developed by Team Wallnut",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600))
                                ]),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Divider(
                                  height: 2.0,
                                  thickness: 2.0,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: 13.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Version : 1.2.6",
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.0),
                                Row(
                                  children: [
                                    Text(
                                      "Version : 9",
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          actionsPadding:
                              EdgeInsets.only(bottom: 10.0, right: 10.0),
                          actions: [
                            RaisedButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.done),
                                label: Text("Ok")),
                          ],
                        ));
              },
            ),
            Divider(
              thickness: 2.0,
              color: Colors.grey[500],
            ),
            ListTile(
              focusColor: Colors.grey[800],
              hoverColor: Colors.grey[800],
              leading: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              title: Text(
                'Log out',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                await _auth.signout();
              },
            ),
            Divider(
              thickness: 2.0,
              color: Colors.grey[500],
            ),
          ],
        ),
      ),
    );
  }
}
