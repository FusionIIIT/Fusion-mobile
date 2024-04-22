import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/screens/Compounder/homepage.dart';
import 'package:fusion/services/login_service.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool _focused = false;
bool _focused2 = false;
double bottom =10;

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? username;
  String? pass;

  @override
  Widget build(BuildContext context) {
    final Widget logoWidget = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: (_focused || _focused2) ? 110.0 : 150.0,
      child:Container(

        child: Image.asset('assets/logo.jpg'),
      ),
    );
    final Widget emailFormField =  Focus(
      onFocusChange: (focus) {
        setState(() {
          _focused = focus;
          if (focus==true){
            bottom=400;
          }

        });
      },
      child:TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        label: Text('Username', style: TextStyle(
          fontSize: 18.0,
        ),),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: Color(0xFFf4f4f4)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: Color(0xFFf4f4f4)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        // enabledBorder: InputBorder.none,
        fillColor: Color(0xFFf4f4f4), // Green color
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      cursorColor: Colors.black,

      onChanged: (input) {
        username = input;
      },
      validator: (String? value) {
        if (value?.length == 0) {
          return 'Please enter username';
        } else if (value?.contains('@') == true) {
          return 'Please enter username only';
        }
        return null;

      },
      autofillHints: [AutofillHints.username],
    ));

    final Widget passwordFormField = Focus(
        onFocusChange: (focus) {
          setState(() {
            _focused2 = focus;
            if (focus==true){
              bottom=400;
            }

          });
        },
        child: TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        label: Text('Password', style: TextStyle(
          fontSize: 18.0,
        ),),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: Color(0xFFf4f4f4)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: Color(0xFFf4f4f4)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        // enabledBorder: InputBorder.none,
        fillColor: Color(0xFFf4f4f4), // Green color
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      cursorColor: Colors.black,
      onChanged: (input) {
        pass = input;
      },
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Please enter Password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      autofillHints: [AutofillHints.password],
    ));

    final loginButton = Padding(
      padding: EdgeInsets.only(top: 16.0),
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
              Navigator.pushReplacementNamed(context, '/landing');
            }
          }
        },
        // color: Colors.deepOrangeAccent,
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,

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
    final compounder = TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/compounder/home");
      },
      child: Text(
        'Login as Compounder',
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
              padding: EdgeInsets.only(top:8.0,left: 24.0, right: 24.0),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0), // Change the top padding here
                  child: logoWidget,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    'Fusion',
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
                Padding(
                  padding: EdgeInsets.only(bottom: 0.0),
                  child: loginButton,
                ),
                Padding(
                  padding: EdgeInsets.only(top:0.0,bottom: bottom),
                  child: forgotLabel,
                ),

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