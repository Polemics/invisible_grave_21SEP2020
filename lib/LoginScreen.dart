import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  static const Color PASKR_BLUE = Color.fromARGB(255, 47, 130, 237);
  bool passwordVisible = true;

  final email = TextEditingController();
  final password = TextEditingController();
  final token = TextEditingController();

  var loading = false;
  var tempGcLogin = "";

  void loginButtonPressed(
      String email, String password, BuildContext context) async {
    print('pressed login');
  }

  void forgotPasswordButtonPressed(String username) async {
    print('forgot password');
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
        controller: email,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          hintText: "Email",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
        ));

    final passwordField = TextField(
      obscureText: passwordVisible,
      controller: password,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          hintText: "Password",
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: PASKR_BLUE,
            ),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: PASKR_BLUE,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10),
        onPressed: () {
          setState(() {
            loading = true;
          });
          loginButtonPressed(email.text, password.text, context);
        },
        child: Text("Login",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
    );

    return MaterialApp(
        home: Scaffold(
            body: Center(
      child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Image(
                      //   image: AssetImage('images/TributerraWhite1024.png'),
                      //   width: 100,
                      // ),
                      SizedBox(height: 30),
                      emailField,
                      SizedBox(height: 15),
                      passwordField,
                      SizedBox(height: 30),
                      loginButon,
                      SizedBox(
                        height: 15,
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            loading = true;
                          });
                          forgotPasswordButtonPressed(email.text);
                        },
                        child: Text("Forgot your password?",
                            style: TextStyle(color: PASKR_BLUE, fontSize: 16)),
                      )
                    ],
                  )),
              Visibility(
                visible: loading,
                child: Center(
                    child: SizedBox.expand(
                        child: Container(
                            color: Colors.white.withOpacity(0.8),
                            child: Center(
                                child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: CircularProgressIndicator()))))),
              )
            ],
          )),
    )));
  }
}

Future<bool> isConnected(BuildContext context) async {
  bool isConnected = false;

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      isConnected = true;
      print('connected');
    }
  } on SocketException catch (_) {
    //alertWithMessage("Error", "No Internet connection Detected", context);
  }
  return isConnected;
}
