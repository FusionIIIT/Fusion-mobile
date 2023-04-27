import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';

import 'package:fusion/services/health_service.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

//int get _value=>_value;

class _AppointmentState extends State<Appointment> {
  int _value = 1;
  String select_date = '', drname = '', from_time = '', to_time = '', issues = '';


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
          Text(
            "Doctor",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: Container(
              height: 0.5,
              width: 130.0,
              color: Colors.black,
            ),
          ),
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
                  child: Text("Dr. John Doe"),
                  value: 3,
                ),
                DropdownMenuItem(child: Text("Dr. Jyoti"), value: 4),
              ],
              onChanged: (value) {
                setState(() {
                  _value = value as int ;
                  if(_value==2) drname= "Dr G.S. Sandhu";
                  else if(_value==3) drname="Dr Preeti Singh";

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

            // Adding first date (for this we can't select past date)

            // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
            initialValue: DateTime.now(),
            firstDate: DateTime.now(),

            validator: (e) =>
            (e?.day ?? 0) == 1 ? 'Please not the first day' : null,

            onDateSelected: (DateTime value) {
              // print(value);
              select_date = DateFormat('yyyy-MM-dd').format(value);

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

            validator: (e) =>
            (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
            onDateSelected: (DateTime value) {
              // print(value);
              from_time = DateFormat('HH:mm:ss').format(value);
              // print(from_time);
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
            to_time = DateFormat('HH:mm:ss').format(value);
            DateTime fromTime = DateFormat('HH:mm:ss').parse(from_time);
            DateTime toTime = DateFormat('HH:mm:ss').parse(to_time);
            if (toTime.isBefore(fromTime)) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Invalid Time'),
                    content: Text(
                      'The from time cannot be greater than or equal to the to time.',
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          TextFormField(
              cursorHeight: 30,
              decoration: new InputDecoration(
                labelText: "Issues/Symptoms",
                fillColor: Colors.white,
                border: new OutlineInputBorder(),
                //fillColor: Colors.green
              ),
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
              onChanged: (value) {
                setState(() {
                  issues = value;
                });
              }),
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 5.0)), //FlatButton not found in healthcenter

          Center(
            child: SizedBox(
              width: 100,
              height: 40,
              child: TextButton(
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 20),
                ),

                // try something new here

                onPressed: () async {
                  HeathService auth = HeathService();
                  bool lodge = await auth.doctorAppoinment(
                    _value,
                    // drname,
                    select_date,
                    from_time,
                    to_time,
                    issues,
                  );
                  print(select_date);
                  print(drname);
                  print(to_time);
                  // print(reason);
                  print(lodge);
                  // TextInput.finishAutofillContext();
                  if (lodge == true) {
                    return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Success"),
                        content: Text("appointment Request Added Successfully"),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("okay"),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Failed"),
                        content: Text("Cannot add appointment Request"),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("okay"),
                          ),
                        ],
                      ),
                    );
                  }
                },

                // end something new here

                // onPressed: () {
                //   print(date);
                //   print(to_time);
                //   print(from_time);
                //   print(issues);
                //   print('Submitted Successfully!');
                // },
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