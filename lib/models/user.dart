class Userwallnut {
  final String uid;
  Userwallnut({this.uid});
}

class UserData {
  final String uid;
  final int expense;
  final int income;

  UserData({this.uid, this.expense, this.income});
}

class Totals {
  final double grandBalance, grandIncome, grandExpense;

  Totals({this.grandBalance, this.grandIncome, this.grandExpense});
}
