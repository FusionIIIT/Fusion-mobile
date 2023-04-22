import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
// import 'package:fusion/services/storage_service.dart';

import 'package:fusion/services/health_service.dart';
import 'package:intl/intl.dart';

class AmbulanceRequest extends StatefulWidget {
  // here is changes for user_id
  // final String? ambulanceRequesterRollNo;
  // AmbulanceRequest(this.ambulanceRequesterRollNo);

  @override
  _AmbulanceRequestState createState() => _AmbulanceRequestState();
}

class _AmbulanceRequestState extends State<AmbulanceRequest> {
  int _value = 1;
  String start_date = '', end_date = '', reason = '';

  // String? user_id = widget.ambulanceRequesterRollNo;
  // String? worker_id = "";

  TextEditingController reasonController = TextEditingController();

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

            // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
            initialValue: DateTime.now(),
            firstDate: DateTime.now(),

            validator: (e) =>
                (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
            onDateSelected: (DateTime value) {
              // start_date = value.toString();
              start_date = DateFormat('yyyy-MM-dd').format(value);
              print(start_date);
            },
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
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

            // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
            initialValue: DateTime.now(),
            firstDate: DateTime.now(),

            validator: (e) =>
                (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
            onDateSelected: (DateTime value) {
              // end_date = value.toString();
              end_date = DateFormat('yyyy-MM-dd').format(value);
              print(end_date);
            },
          ),
          // adding time for ambulence request
          // Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          TextFormField(
            maxLines: 4,
            cursorHeight: 30,
            controller: reasonController,
            // onChanged: (value) => reasonController.text = value,
            onChanged: (value) {
              setState(() {
                reason = value.toString();
              });
            },
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

                // try something new

                onPressed: () async {
                  HeathService auth = HeathService();
                  bool lodge = await auth.getAmbulence(
                    // user_id,
                    start_date,
                    end_date,
                    reason,
                  );

                  // print(start_date);
                  // print(end_date);
                  // print(reason);
                  // print(lodge);

                  // TextInput.finishAutofillContext();
                  if (lodge == true) {
                    return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Success"),
                        content: Text("Ambulance Request Added Successfully"),
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
                        content: Text("Cannot add Ambulance Request"),
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

                //end something new

                // onPressed: () {
                //   print('Submitted Successfully ni!');
                //   // reason = Text(reasonController.text).toString();
                //   var res = reasonController.text;
                //   print(res);
                //   print(reason);
                //   print(start_date);
                //   print(end_date);
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
