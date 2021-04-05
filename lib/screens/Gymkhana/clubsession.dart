import 'package:flutter/material.dart';


class ClubDropDown extends StatefulWidget {
  @override
  _ClubDropDownState createState() => _ClubDropDownState();
}



class _ClubDropDownState extends State<ClubDropDown> {

  int _value = 1;

  @override

  Widget SessionView=new Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
    child: Table(
      border: TableBorder.all(color: Colors.black),
      children: [
        TableRow(children: [
          Center(child: Text("\nVenue\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
          Center(child:Column(
            children: [
              Center(child: Text("\nDate\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            ],
          )),
          Center(child:Column(
            children: [
              Center(child: Text("\nTime\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            ],
          )),
          Center(child:Column(
            children: [
              Center(child: Text("\nDetails\n",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
            ],
          )),
        ]),
        TableRow(children: [
          Center(child: Text("\nL-201\n",style: TextStyle(fontSize: 16,)),),
          Center(child:Text("\n22 Mar,21\n",style: TextStyle(fontSize: 16)),),
          Center(child:Text("\n6:00PM\n",style: TextStyle(fontSize: 16,)),),
          Center(child: IconButton(icon: Icon(Icons.attachment_sharp), onPressed:null),),
        ])
      ],
    ),
  );

int get value=>value;

  Widget build(BuildContext context) {
    return Container(
        width: 200,
        //color: Colors.blue,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Text("Club",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:0.0),
              child:Container(
                height:1.0,
                width:130.0,
                color:Colors.black,),),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            DropdownButton(
                dropdownColor: Colors.deepOrangeAccent,
                elevation: 16,
                value: _value,
                isExpanded: true,
                hint: Text("-SELECT-"),
                items: [
                  DropdownMenuItem(
                    child: Text("--SELECT--"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Saaz"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                      child: Text("Avartan"),
                      value: 3,
                  ),
                  DropdownMenuItem(
                      child: Text("Electronics"),
                      value: 4,
                  ),
                ],
                onChanged: (value) {
                  //int val=value;
                  setState(() {
                    _value = this.value;
                  });
                }),
            Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
            SessionView,
          ],
        )
    );
  }
}