import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/login_service.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool checkBoxValue = false;

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? username;
  String? pass;

  @override
  Widget build(BuildContext context) {

    final Widget logoWidget = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 54.0,
      child: Image.asset('assets/logo.jpg'),
    );
    final Widget emailFormField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        label: Text('Username', style: TextStyle(
          fontSize: 12.0,
        ),),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onChanged: (input) {
        username = input;
      },
      validator: (String? value) {
        if (value?.length == 0) {
          return 'Please enter username';
        }
        else if (value?.contains('@') == true) {
          return 'Please enter username only';
        }

      },
      autofillHints: [AutofillHints.username],
    );

    final Widget passwordFormField = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        label: Text('Password', style: TextStyle(
          fontSize: 12.0,
        ),),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onChanged: (input) {
        pass = input;
      },
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Please enter Password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
      },
      autofillHints: [AutofillHints.password],
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        ),
        onPressed: () async {
          if (!(_formKey.currentState?.validate() ?? false)) {
          } else {
            LoginService auth = LoginService();
            bool complete = await auth.login(username ?? "", pass ?? "");
            TextInput.finishAutofillContext();
            if (complete == true) {
              Navigator.pushReplacementNamed(context, "/landing");
            }
            Navigator.pushReplacementNamed(context, "/landing");
          }
        },
        // color: Colors.deepOrangeAccent,
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
        ),
      ),
    );
    final forgotLabel = TextButton(
      onPressed: () {
        // TODO: Add Forgot Password API
      },
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54, fontSize: 12),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AutofillGroup(
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logoWidget,
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    'Fusion Login',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                    child: emailFormField,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: passwordFormField,
                ),
                loginButton,
                forgotLabel,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _showDialog() {
  //   // flutter defined function
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       // return object of type Dialog
  //       return AlertDialog(
  //         title: Text("Invalid Username/Password"),
  //         content: Text("Please enter correct Username or Password"),
  //         actions: <Widget>[
  //           // usually buttons at the bottom of the dialog
  //           new TextButton(
  //             child: new Text(
  //               "Close",
  //               style: TextStyle(color: Colors.deepOrangeAccent),
  //             ),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}