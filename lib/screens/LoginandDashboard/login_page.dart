import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/services/login_service.dart';
import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool checkBoxValue = false;

class _LoginPageState extends State<LoginPage> {
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
        hintText: 'Username/Email*',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onChanged: (input) {
        username = input;
      },
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
          onPressed: () {
            LoginService auth = LoginService();
            auth.login(username!, pass!);
            Navigator.pushReplacementNamed(context, "/landing");
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
      onPressed: () {},
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
    );
  }
}
