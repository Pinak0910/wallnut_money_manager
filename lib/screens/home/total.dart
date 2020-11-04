import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallnut_money_manager/models/user.dart';
import 'package:wallnut_money_manager/services/database.dart';
import 'package:wallnut_money_manager/shared/loading.dart';

class Totalssc extends StatefulWidget {
  @override
  _TotalsscState createState() => _TotalsscState();
}

class _TotalsscState extends State<Totalssc> {
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DatabaseService(uid: user.uid).totals,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Totals totaldata = snapshot.data;
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Total Income",
                                textAlign: TextAlign.center,
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${totaldata.grandIncome}',
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      thickness: 2.0,
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Total Expense",
                                textAlign: TextAlign.center,
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${totaldata.grandExpense}',
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      thickness: 2.0,
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Total Balance",
                                textAlign: TextAlign.center,
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${totaldata.grandBalance}',
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
