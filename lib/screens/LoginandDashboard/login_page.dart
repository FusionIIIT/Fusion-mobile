import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/services/login_service.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool checkBoxValue = false;

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String? username;
    String? pass;

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 54.0,
        child: Image.asset('assets/logo.jpg'),
      ),
    );
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Username*',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onChanged: (input) {
        username = input;
      },
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Please enter username';
        }
        if (value.contains('@')) {
          return 'Please enter username only';
        }
      },
      autofillHints: [AutofillHints.username],
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password*',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onChanged: (input) {
        pass = input;
      },
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Please enter Password';
        } else if (value.length < 6) {
          return 'Password must be  at least 6 characters';
        }
      },
      autofillHints: [AutofillHints.password],
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () async {
            if (!(_formKey.currentState!.validate())) {
              print('Unsuccessful');
            } else {
              LoginService auth = LoginService();
              bool complete = await auth.login(username!, pass!);
              TextInput.finishAutofillContext();
              if (complete == true) {
                Navigator.pushReplacementNamed(context, "/landing");
              }
              Navigator.pushReplacementNamed(context, "/landing");
            }
          },
          color: Colors.deepOrangeAccent,
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
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
        style: TextStyle(color: Colors.black54),
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
                logo,
                Text(
                  'Fusion Login',
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 48.0),
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 8.0),
                loginButton,
                forgotLabel,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Invalid Username/Password"),
          content: Text("Please enter correct Username or Password"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text(
                "Close",
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
