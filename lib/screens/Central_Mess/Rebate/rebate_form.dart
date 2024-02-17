import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class RebateForm extends StatefulWidget {
  @override
  _RebateFormState createState() => _RebateFormState();
}

//int get _value=>_value;

class _RebateFormState extends State<RebateForm> {
  String?_value1, _value2;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: 200,
      //height: 120,
      //color: Colors.blue,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(30.0),
      child: ListView(
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
            validator: (e) =>
            (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
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
            validator: (e) =>
            (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
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
              border: new OutlineInputBorder(),
              //fillColor: Colors.green
            ),
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
          Center(
            child: TextButton(
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 15.0),
              ),
              // color: Colors.deepOrangeAccent,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
