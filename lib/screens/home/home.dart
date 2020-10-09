import 'package:flutter/material.dart';
import 'main_drawer.dart';
import 'package:wallnut_money_manager/adds/addExpense.dart';
import 'package:wallnut_money_manager/adds/addIncome.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Money Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: Colors.grey[900],
      ),
      drawer: MainDrawer(),
      drawerEnableOpenDragGesture: true,
      body: Column(
        children: <Widget>[
          Container(
            height: 70,
            margin:
                EdgeInsets.only(top: 15.0, right: 8.0, left: 8.0, bottom: 10.0),
            decoration: BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black,
                    blurRadius: 10.0,
                  )
                ],
                border: Border.all(
                    style: BorderStyle.solid, width: 2.0, color: Colors.black),
                color: Colors.grey[200],
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
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$1030",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15.0),
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
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$830",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15.0),
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
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$200",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          child: Icon(
            Icons.add_box,
            color: Colors.white,
          ),
          backgroundColor: Colors.grey[900],
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => new AlertDialog(
                    backgroundColor: Colors.black54,
                    shape: BeveledRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(20, 10))),
                    title: Center(
                        child: new Text(
                      "ADD",
                      style: TextStyle(color: Colors.white),
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
                                    color: Colors.green[400],
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Center(
                                  child: FlatButton.icon(
                                      onPressed: () {
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
                                            color: Colors.black,
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
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: FlatButton.icon(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddExpense()));
                                      },
                                      icon: Icon(
                                        Icons.add_box,
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        'Add Expense',
                                        style: TextStyle(
                                            color: Colors.black,
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
