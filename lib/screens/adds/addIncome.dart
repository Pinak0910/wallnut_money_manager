import 'package:flutter/material.dart';
import 'package:wallnut_money_manager/services/database.dart';

class AddIncome extends StatefulWidget {
  @override
  _AddIncomeState createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  TextEditingController _incomecontroller, _descontroller;
  final DatabaseService db = DatabaseService();
  String _category, description, type = 'Income';
  double income;
  List<String> _categoryvalues = [
    'Allowance',
    'Stipend',
    'Salary',
    'Bonus',
    'Others'
  ];

  @override
  void initState() {
    super.initState();
    _incomecontroller = new TextEditingController();
    _descontroller = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Form(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient:
                            LinearGradient(begin: Alignment.topCenter, colors: [
                      Colors.grey[900],
                      Colors.grey[900],
                      Colors.grey[800],
                      Colors.grey[700],
                      Colors.grey[600],
                      Colors.grey[600]
                    ])),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Add Income",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Save your Money",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50))),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(
                                                      225, 95, 27, .3),
                                                  blurRadius: 20,
                                                  offset: Offset(0, 10))
                                            ]),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.all(15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    TextFormField(
                                                      controller:
                                                          _incomecontroller,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'Add Income',
                                                        prefixIcon: Icon(
                                                          Icons.attach_money,
                                                          size: 30,
                                                        ),
                                                        fillColor:
                                                            Colors.grey[100],
                                                        filled: true,
                                                        contentPadding:
                                                            EdgeInsets.all(15),
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    TextFormField(
                                                      controller:
                                                          _descontroller,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'Description',
                                                        prefixIcon: Icon(
                                                          Icons.description,
                                                          size: 30,
                                                        ),
                                                        fillColor:
                                                            Colors.grey[100],
                                                        filled: true,
                                                        contentPadding:
                                                            EdgeInsets.all(15),
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    Container(
                                                      child: Center(
                                                        child: DropdownButton(
                                                          icon: Icon(
                                                              Icons
                                                                  .arrow_downward,
                                                              color:
                                                                  Colors.black),
                                                          iconEnabledColor:
                                                              Colors.grey[300],
                                                          iconDisabledColor:
                                                              Colors.grey[200],
                                                          isExpanded: true,
                                                          hint: Text(
                                                              "Choose source of income"),
                                                          dropdownColor:
                                                              Colors.grey[200],
                                                          value: _category,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _category = value;
                                                            });
                                                          },
                                                          items: _categoryvalues
                                                              .map((value) {
                                                            return DropdownMenuItem(
                                                              value: value,
                                                              child:
                                                                  Text(value),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.0),
                                                    Container(
                                                      height: 50,
                                                      width: 1000,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      child: RaisedButton(
                                                        child: Text(
                                                            'Add Income',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            )),
                                                        onPressed: () {
                                                          saveData();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        color: Colors.grey[900],
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ])))),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            backgroundColor: Colors.grey[900],
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ));
  }

  void saveData() {
    income = double.parse(_incomecontroller.text);
    if (_descontroller.text == "") {
      description = "No Description added";
    } else {
      description = _descontroller.text;
    }
    if (_category == null) {
      _category = "No category selected";
    }
    db.updateTransactionuser(type, income, description, _category);
  }
}
