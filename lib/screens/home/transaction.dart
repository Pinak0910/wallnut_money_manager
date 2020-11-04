import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallnut_money_manager/shared/loading.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  bool _isloading = true;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> transactions;
  User user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    _fetchTransactions();
    super.initState();
  }

  _fetchTransactions() async {
    try {
      setState(() {
        _isloading = true;
      });
      QuerySnapshot snap = await _firebaseFirestore
          .collection('wallnutusers')
          .doc(user.uid)
          .collection(user.email)
          .orderBy("Date", descending: true)
          .get();
      setState(() {
        transactions = snap.docs;
        _isloading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isloading) {
      return Loading();
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: RefreshIndicator(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (BuildContext context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: (transactions[i].data()['Type'] == 'Income'
                            ? Colors.grey[350]
                            : Colors.grey[600]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                transactions[i].data()['Type'],
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                    fontWeight: FontWeight.w600,
                                    color: (transactions[i].data()['Type'] ==
                                            'Income'
                                        ? Colors.black
                                        : Colors.grey[50]),
                                    fontSize: 20.0),
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                'Date : ${transactions[i].data()['Date'].toString().substring(0, 10)}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
//                                   fontFamily: 'GrenzeGotisch',
                                  color: (transactions[i].data()['Type'] ==
                                          'Income'
                                      ? Colors.black
                                      : Colors.grey[50]),
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                'Amount : ${transactions[i].data()['Amount'].toString()}',
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                    color: (transactions[i].data()['Type'] ==
                                            'Income'
                                        ? Colors.black
                                        : Colors.grey[50]),
                                    fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                'Description : ${transactions[i].data()['Description']}',
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                    color: (transactions[i].data()['Type'] ==
                                            'Income'
                                        ? Colors.black
                                        : Colors.grey[50]),
                                    fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                'Category : ${transactions[i].data()['Category']}',
                                style: TextStyle(
//                                     fontFamily: 'GrenzeGotisch',
                                    color: (transactions[i].data()['Type'] ==
                                            'Income'
                                        ? Colors.black
                                        : Colors.grey[50]),
                                    fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          onRefresh: () {
            return _fetchTransactions();
          },
        ),
      );
    }
  }
}
