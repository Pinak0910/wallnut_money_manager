import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallnut_money_manager/models/user.dart';

class DatabaseService {
  final String uid;

  var brews;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('wallnutusers');
  User user = FirebaseAuth.instance.currentUser;

  Future<void> updateUserData(String name, String email, String password,
      double balance, double income, double expense) async {
    return await brewCollection.doc(user.uid).set({
      'name': name,
      'email': email,
      'grand_balance': balance,
      'grand_income': income,
      'grand_expense': expense,
      'password': password,
    });
  }

  // Future<void> setdefaultData() async {
  //   return await brewCollection.doc(user.uid).update({
  //     'grand_balance': 0,
  //     'grand_income': 0,
  //     'grand_expense': 0,
  //   });
  // }

  Future<void> updateTransactionuser(
      String type, double amount, String description, String category) async {
    if (type.compareTo("Income") == 0) {
      var data = await brewCollection.doc(user.uid).get();
      double balance = data['grand_balance'] + amount;
      double income = data['grand_income'] + amount;
      await brewCollection.doc(user.uid).update({
        'grand_balance': balance,
        'grand_income': income,
      });
    } else {
      var data = await brewCollection.doc(user.uid).get();
      double balance = data['grand_balance'] - amount;
      double expense = data['grand_expense'] + amount;
      await brewCollection.doc(user.uid).update({
        'grand_balance': balance,
        'grand_expense': expense,
      });
    }
    return await brewCollection.doc(user.uid).collection(user.email).add({
      'Type': type,
      'Amount': amount,
      'Description': description,
      'Category': category,
      'Date': DateTime.now().toString(),
    });
  }

  Future<void> setdefault() async {
    var data = await brewCollection.doc(user.uid).get();
    double balance = data['grand_balance'] * 0;
    double expense = data['grand_expense'] * 0;
    double income = data['grand_income'] * 0;
    await brewCollection.doc(user.uid).update({
      'grand_balance': balance,
      'grand_income': income,
      'grand_expense': expense,
    });
  }

  Totals _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return Totals(
      grandBalance: snapshot['grand_balance'],
      grandIncome: snapshot['grand_income'],
      grandExpense: snapshot['grand_expense'],
    );
  }

  Stream<Totals> get totals {
    return brewCollection.doc(user.uid).snapshots().map(_userDataFromSnapshot);
  }
}
