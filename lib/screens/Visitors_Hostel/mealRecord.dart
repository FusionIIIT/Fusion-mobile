import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';

class MealRecord extends StatefulWidget {
  @override
  State<MealRecord> createState() => _MealRecordState();
}

class _MealRecordState extends State<MealRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().visitorHostelAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 247, 247),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 24.0),
                  Text(
                    "Meals Record",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
