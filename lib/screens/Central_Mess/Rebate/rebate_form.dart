import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class RebateForm extends StatefulWidget {
  @override
  _RebateFormState createState() => _RebateFormState();
}

class _RebateFormState extends State<RebateForm> {
  bool _loading = false, _updateDish = false;
  String? reasonForRebate;
  DateTime? selectedDateStart, selectedDateEnd;
  final _messFormKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Form(
                key: _messFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.0),
                    DateTimeFormField(
                      decoration: InputDecoration(
                        labelText: 'Select Start Date',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: Icon(Icons.event_note),
                        filled: true,
                        fillColor: Colors.white,
                        errorText: _updateDish && selectedDateStart == null
                            ? 'Please select a start date'
                            : null,
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      onDateSelected: (DateTime value) {
                        setState(() {
                          selectedDateStart = value;
                        });
                      },
                        firstDate: DateTime.now()
                    ),
                    SizedBox(height: 30.0),
                    DateTimeFormField(
                      decoration: InputDecoration(
                        labelText: 'Select End Date',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: Icon(Icons.event_note),
                        filled: true,
                        fillColor: Colors.white,
                        errorText: _updateDish && selectedDateEnd == null
                            ? 'Please select an end date'
                            : null,
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      onDateSelected: (DateTime value) {
                        setState(() {
                          selectedDateEnd = value;
                        });
                      },
                        firstDate: DateTime.now()
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      controller: _reasonController,
                      maxLines: 4,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: 'Reason for Rebate',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        errorText: _updateDish && (reasonForRebate == null || reasonForRebate!.isEmpty)
                            ? 'Enter a reason for rebate'
                            : null,
                      ),
                      onChanged: (value) {
                        setState(() {
                          reasonForRebate = value;
                        });
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      style: style,
                      onPressed: () {
                        setState(() {
                          _updateDish = true;
                        });
                        if (_messFormKey.currentState!.validate()) {
                          // Handle valid flow
                          // Now we can perform actions based on the selected mess
                        }
                      },
                      child: Text("Submit"),
                    )
                  ],
                ),
              ),
            ),
          ),
          // updated successfully
          // _updateDish
          //     ? Column(
          //   children:
          // )
          //     : SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
