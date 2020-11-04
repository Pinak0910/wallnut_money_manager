import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallnut_money_manager/services/auth.dart';
import 'package:wallnut_money_manager/services/database.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final AuthService _auth = AuthService();

  final User user = FirebaseAuth.instance.currentUser;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final DatabaseService db = new DatabaseService();

  var data;

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('wallnutusers');

  fetchdata() async {
    data = await brewCollection.doc(user.uid).get();
  }

  @override
  Widget build(BuildContext context) {
    fetchdata();
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
                  SizedBox(height: 135.0),
                  Text(
                    'Logged using',
                    style: TextStyle(
//                         fontFamily: 'GrenzeGotisch',
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    user.email,
                    style: TextStyle(
//                         fontFamily: 'GrenzeGotisch',
                        fontSize: 15,
                        color: Colors.white),
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
//                   fontFamily: 'GrenzeGotisch',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                fetchdata();
                showDialog(
                  context: context,
                  builder: (context) => new AlertDialog(
                    backgroundColor: Colors.white,
                    shape: BeveledRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(20, 10))),
                    title: Center(
                        child: Column(
                      children: [
                        Text(
                          "Profile",
                          style: TextStyle(
//                               fontFamily: 'GrenzeGotisch',
                                 color: Colors.black),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Divider(
                          height: 3.0,
                          thickness: 2.0,
                          color: Colors.black,
                        ),
                      ],
                    )),
                    content: Container(
                      width: double.infinity,
                      height: 130,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                'Username : ${data['name']}',
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                  fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Email : ${data['email']}',
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                  fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Balance : ${data['grand_balance']}',
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                  fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Income : ${data['grand_income']}',
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                  fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Expense : ${data['grand_expense']}',
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                  fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                        ],
                      ),
                    ),
                    // actionsPadding: EdgeInsets.only(bottom: 10.0, right: 10.0),
                    // actions: [
                    //   RaisedButton.icon(
                    //       onPressed: () {
                    //         Navigator.pop(context);
                    //       },
                    //       icon: Icon(Icons.done),
                    //       label: Text("Ok")),
                    // ],
                  ),
                );
              },
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
//                   fontFamily: 'GrenzeGotisch',
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Do you want to clear Data ?"),
                    actions: [
                      FlatButton(
                          onPressed: () async {
                            _firebaseFirestore
                                .collection('wallnutusers')
                                .doc(user.uid)
                                .collection(user.email)
                                .get()
                                .then((snaphot) async {
                              for (DocumentSnapshot ds in snaphot.docs) {
                                ds.reference.delete();
                              }
                              db.setdefault();

                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('Data cleared.'),
                                        actions: [
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: Text('Ok'))
                                        ],
                                      ));
                            });
                          },
                          child: Text("Yes")),
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("No"))
                    ],
                  ),
                  barrierDismissible: false,
                );
                //db.setdefaultData();
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail, color: Colors.black),
              title: Text(
                "About Us",
                 style: TextStyle(
//                    fontFamily: 'GrenzeGotisch',
                   fontSize: 18.0),
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
//                                 fontFamily: 'GrenzeGotisch',
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
//                                           fontFamily: 'GrenzeGotisch',
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
//                   fontFamily: 'GrenzeGotisch',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Are you sure to Log out ?'),
                          actions: [
                            FlatButton(
                                onPressed: () async {
                                  await _auth.signout();
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                  ),
                                )),
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'No',
                                  style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                  ),
                                ))
                          ],
                        ));
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
