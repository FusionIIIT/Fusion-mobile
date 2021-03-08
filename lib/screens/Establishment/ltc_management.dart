


import 'package:flutter/material.dart';


class LtcManagement extends StatefulWidget {
  @override
  _LtcManagementState createState() => _LtcManagementState();
}

class _LtcManagementState extends State<LtcManagement> {
  bool _second1 = true;
  bool _second2 = false;
  @override
  Widget build(BuildContext context) {
    return Card (
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal:15,vertical: 15),
      shadowColor: Colors.black87,
      child: Column(
        children: [
          Container(
            child:TextButton(
              onPressed: ()  {
                setState(() {
                  _second1=true;
                  _second2=false;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'LTC  info',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: _second1 ? Colors.black:Colors.deepOrange,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child:TextButton(
            onPressed: () {
              setState(() {
                _second1=false;
                _second2=true;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Review applications',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: _second2 ? Colors.black87: Colors.deepOrange,
                  ),
                ),
                Icon(
                  Icons.arrow_right,
                )
              ],
            ),
          ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

