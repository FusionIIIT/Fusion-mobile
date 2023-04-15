import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class AmbulanceRequest extends StatefulWidget {
  @override
  _AmbulanceRequestState createState() => _AmbulanceRequestState();
}

class _AmbulanceRequestState extends State<AmbulanceRequest> {
  int _value = 1;
  String date = '', drname = '', from_time = '', to_time = '', issues = '';

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
              labelText: 'Date',
            ),
            mode: DateTimeFieldPickerMode.date,
            autovalidateMode: AutovalidateMode.always,

            // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
            initialValue: DateTime.now(),
            firstDate: DateTime.now(),

            validator: (e) =>
                (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
            onDateSelected: (DateTime value) {
              print(value);
            },
          ),
          // adding time for ambulence request
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

            //  For time validation -----------> Pradeep

            validator: (e) =>
                (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
            onDateSelected: (DateTime value) {
              print(value);
            },
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          TextFormField(
            maxLines: 1,
            // cursorHeight: 30,
            decoration: new InputDecoration(
              labelText: "Picking point",
              fillColor: Colors.white,
              border: new OutlineInputBorder(),
              //fillColor: Colors.green
            ),
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          TextFormField(
            maxLines: 4,
            cursorHeight: 30,
            decoration: new InputDecoration(
              labelText: "Reason",
              fillColor: Colors.white,
              border: new OutlineInputBorder(),
              //fillColor: Colors.green
            ),
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
          Center(
            child: SizedBox(
              width: 100,
              height: 40,
              child: TextButton(
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  print('Submitted Successfully!');
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.red),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.red),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
