import 'package:flutter/material.dart';
import 'package:wallnut_money_manager/services/auth.dart';
import 'package:wallnut_money_manager/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Container(
              child: Form(
                key: _formkey,
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
                              "Login",
                              textDirection: TextDirection.ltr,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Welcome Back to your Wallnut",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                )
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
                                        borderRadius: BorderRadius.circular(10),
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
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey))),
                                          child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: "Enter your email",
                                                hintStyle: TextStyle(
                                                    color: Colors.black54),
                                                border: InputBorder.none,
                                              ),
                                              validator: (val) => val.isEmpty
                                                  ? 'Enter an email'
                                                  : null,
                                              onChanged: (val) {
                                                setState(() => email = val);
                                              }),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey))),
                                          child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: "Enter your password",
                                                hintStyle: TextStyle(
                                                    color: Colors.black54),
                                                border: InputBorder.none,
                                              ),
                                              obscureText: true,
                                              validator: (val) => val.length < 8
                                                  ? 'Enter a password 8+ chars long'
                                                  : null,
                                              onChanged: (val) {
                                                setState(() => password = val);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 300,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.orange[900]),
                                    child: RaisedButton(
                                        elevation: 5.0,
                                        color: Colors.grey[800],
                                        child: Text(
                                          'Login',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () async {
                                          if (_formkey.currentState
                                              .validate()) {
                                            setState(() => loading = true);
                                            dynamic result = await _auth
                                                .signInWithEmailAndPassword(
                                                    email, password);
                                            if (result == null) {
                                              setState(() => error =
                                                  'Could not sign in with those credentials');
                                              loading = false;
                                            }
                                          }
                                        }),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    "Continue with registering yourself",
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 15.0),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: Container(
                                        width: 600,
                                        child: Center(
                                          child: RaisedButton.icon(
                                            elevation: 8.0,
                                            onPressed: () {
                                              widget.toggleView();
                                            },
                                            icon: Icon(
                                              Icons.person_add,
                                              color: Colors.white,
                                            ),
                                            label: Text(
                                              "Register here !",
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
