

import 'package:flutter/material.dart';


class CpdaManagement extends StatefulWidget {
  @override
  _CpdaManagementState createState() => _CpdaManagementState();
}

class _CpdaManagementState extends State<CpdaManagement> {
  bool _first1 = true;
  bool _first2 = false;
  bool _first3 = false;
  bool _first4 = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal:15,vertical: 10),
      shadowColor: Colors.black38,
      child: Column(
        children: [
          Container(
            child:TextButton(
              onPressed: ()  {
                setState(() {
                  _first1=true;
                  _first2=false;
                  _first3=false;
                  _first4=false;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CPDA Request',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: _first1? Colors.black:Colors.deepOrange,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            child:TextButton(
              onPressed: ()  {
                setState(() {
                  _first1=false;
                  _first2=true;
                  _first3=false;
                  _first4=false;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Active Applications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: _first2 ? Colors.black:Colors.deepOrange,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            child:TextButton(
              onPressed: ()  {
                setState(() {
                  _first1=false;
                  _first2=false;
                  _first3=true;
                  _first4=false;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Archieved  Applications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: _first3 ? Colors.black:Colors.deepOrange,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            child:TextButton(
              onPressed: ()  {
                setState(() {
                  _first1=false;
                  _first2=false;
                  _first3=false;
                  _first4=true;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Review Applications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: _first4 ? Colors.black:Colors.deepOrange,
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
