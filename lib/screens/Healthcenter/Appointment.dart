import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class Appointment extends StatefulWidget {

  @override
  _AppointmentState createState() => _AppointmentState();
}

//int get _value=>_value;

class _AppointmentState extends State<Appointment> {
  int _value=1;
  @override
  Widget build(BuildContext context) {
    return Container(
     // color: Colors.red,
        width: 200,
        //height: 120,
        //color: Colors.blue,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(30.0),
        child:ListView(
          children: [
            Text("Doctor",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:0.0),
              child:Container(
                height:0.5,
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
                    child: Text("Dr Tony Gupta"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("Dr Hrishi Goyal"),
                    value: 3,

                  ),
                  DropdownMenuItem(
                      child: Text("Dr Preeti Singh"),
                      value: 4
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    //_value = value;
                  });
                }),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            //SessionView,
            DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelText: 'Date',
              ),
              mode: DateTimeFieldPickerMode.date,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                print(value);
              },
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.access_time_rounded),
                labelText: 'From Time',
              ),
              mode: DateTimeFieldPickerMode.time,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                print(value);
              },
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.access_time_rounded),
                labelText: 'To Time',
              ),
              mode: DateTimeFieldPickerMode.time,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                print(value);
              },
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            TextFormField(
              cursorHeight: 30,
              decoration: new InputDecoration(
                labelText: "Issues/Symptoms",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                ),
                //fillColor: Colors.green
              ),
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
            Center(child:FlatButton(
              child: Text('Submit', style: TextStyle(fontSize: 15.0),),
              color: Colors.deepOrangeAccent,
              onPressed: () {},
            ),
            ),
          ],
        ),
    );
  }
}
