import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class AmbulanceRequest extends StatefulWidget {
  @override
  _AmbulanceRequestState createState() => _AmbulanceRequestState();
}

class _AmbulanceRequestState extends State<AmbulanceRequest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(

              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),

                DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'From',
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    print(value);
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),

                DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'To',
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    print(value);
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                TextFormField(
                  maxLines: 4,
                  cursorHeight: 30,
                  decoration: new InputDecoration(
                    labelText: "Reason",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                    ),
                    //fillColor: Colors.green
                  ),
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                Center(child:TextButton(
                  child: Text('Submit', style: TextStyle(fontSize: 15.0),),
                  //color: Colors.deepOrangeAccent,
                  onPressed: () {},
                ),
                ),

              ],

      ),
    );
  }
}
