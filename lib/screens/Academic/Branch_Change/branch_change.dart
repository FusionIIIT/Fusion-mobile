import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class BranchChange extends StatefulWidget {
  @override
  _BranchChangeState createState() => _BranchChangeState();
}

class _BranchChangeState extends State<BranchChange> {
  String _value="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Container(
        child:Row(
          children: [
            Text("Branches:"),
            DropdownButton(
                items:[
                  DropdownMenuItem<String>(
                      value: "1",
                      child: Text("department: Finance and Accounts"),
                  ),
                  DropdownMenuItem<String>(
                    value: "2",
                    child: Text("department: Finance and Accounts"),
                  )
                ],
              onChanged: (value){
                  setState(() {
                    _value = value.toString();
                  });
              },
              hint:Text(
                "--------"
              ),
              value: _value,
            ),
          ],
        )
      ),
    );
  }
}
