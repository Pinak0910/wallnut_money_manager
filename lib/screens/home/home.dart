import 'package:flutter/material.dart';
import 'package:wallnut_money_manager/screens/home/total.dart';
import 'package:wallnut_money_manager/screens/home/transaction.dart';
import 'main_drawer.dart';
import 'package:wallnut_money_manager/screens/adds/addExpense.dart';
import 'package:wallnut_money_manager/screens/adds/addIncome.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
//             fontFamily: 'GrenzeGotisch',
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Container(
              height: 77,
              child: Totalssc(),
            ),
            Container(height: 526.427, child: Transactions()),
          ],
        )),
      ),
      drawerEnableOpenDragGesture: true,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          child: Icon(
            Icons.add_box,
            color: Colors.black,
          ),
          backgroundColor: Colors.grey[400],
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => new AlertDialog(
                    backgroundColor: Colors.white,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Center(
                        child: new Text(
                      "ADD",
                      style: TextStyle(
//                           fontFamily: 'GrenzeGotisch',
                        color: Colors.black),
                    )),
                    content: Container(
                      height: 90.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Center(
                                  child: FlatButton.icon(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddIncome()));
                                      },
                                      icon: Icon(
                                        Icons.add_box,
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        'Add Income',
                                        style: TextStyle(
//                                             fontFamily: 'GrenzeGotisch',
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[600],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: FlatButton.icon(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddExpense()));
                                      },
                                      icon: Icon(
                                        Icons.add_box,
                                        color: Colors.grey[100],
                                      ),
                                      label: Text(
                                        'Add Expense',
                                        style: TextStyle(
//                                             fontFamily: 'GrenzeGotisch',
                                            color: Colors.grey[100],
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )));
          },
        ),
      ),
    );
  }
}
