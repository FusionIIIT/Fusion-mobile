import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class Bonafide extends StatefulWidget {
  @override
  _BonafideState createState() => _BonafideState();
}

class _BonafideState extends State<Bonafide> {
  var details={
    1:"Bonafide for Fee Structure",
    2:"Bonafide for Sim Card",
    3:"Bonafide for Passport",
    4:"Bonafide for Education loan",
    5:"Other purposes",
  };
  List<DropdownMenuItem<int>> _bonafideItems = [];
  void loadlist(){
    _bonafideItems=[];
    for(int i=1; i<=details.length; i++){
      _bonafideItems.add(
        DropdownMenuItem(
            child: Text(details[i]!),
          value:i,
        )
      );
    }
  }

  int _value=1;
  String bonafidefor="";
  @override
  Widget build(BuildContext context) {
    loadlist();
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body:Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text("Apply for Bonafide"),
            Text("Please select the purpose of bonafide:"),
            DropdownButton<int>(
                items:_bonafideItems,
              value:_value,
              onChanged: (value){
                  setState(() {
                    _value = value!;
                    bonafidefor=details[_value]!;
                    print(bonafidefor);
                  });
              },
              isExpanded: true,
            ),
            ElevatedButton(
                onPressed: (){},
                child: Text("Submit"),
            ),
          ]
        ),
      ),
    );
  }
}
