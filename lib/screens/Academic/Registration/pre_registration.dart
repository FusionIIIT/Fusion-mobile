import 'package:flutter/material.dart';

class PreRegistration extends StatefulWidget {
  @override
  _PreRegistrationState createState() => _PreRegistrationState();
}

class _PreRegistrationState extends State<PreRegistration> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('Pre-Registration for Next Sem Courses'),
          Expanded(
              child: Center(
                  child: Text(
            "Pre Registration date hasn't come yet",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          )))
        ],
      ),
    );
  }
}
