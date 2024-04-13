import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/central_mess.dart';

class RebateForm extends StatefulWidget {
  @override
  _RebateFormState createState() => _RebateFormState();
}

class _RebateFormState extends State<RebateForm> {

  CentralMessService _centralMessService = CentralMessService();
  TextEditingController textController = TextEditingController();

  bool _sentRequest = false, _updateDish = false;
  Rebate? data;
  String? reasonForRebate, selectedType;
  DateTime? selectedDateStart, selectedDateEnd;
  
  final _messFormKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _sendRebateRequestData(data) async {
    try {
      http.Response menuItems = await _centralMessService.sendRebateRequest(data);
      if (menuItems.statusCode == 200) {
        print('Sent the Rebate request');
        setState(() {
          _sentRequest = true;
        });
      } else {
        print('Couldn\'t send');
      }
    } catch (e) {
      print('Error sending Rebate Request: $e');
    }
  }

  @override
  void dispose() {
    textController.dispose(); // Dispose the controller
    super.dispose();
  }

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
                    SizedBox(height: 10.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select Leave Type',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Select a day" : null,
                      dropdownColor: Colors.white,
                      value: selectedType,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedType = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                            child: Text("Vacation"),
                            value: "vacation"),
                        DropdownMenuItem(
                            child: Text("Casual"),
                            value: "casual"),
                      ],
                    ),
                    SizedBox(height: 10.0),
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
                    SizedBox(height: 10.0),
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
                    SizedBox(height: 10.0),
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
                          print({selectedType, selectedDateStart, selectedDateEnd, _reasonController.text, DateTime.now()});
                          setState(() {
                            data = Rebate(
                                // studentId: studentId,
                                startDate: selectedDateStart!,
                                endDate: selectedDateEnd!,
                                purpose: _reasonController.text,
                                status: "1",
                                appDate: DateTime.now(),
                                leaveType: selectedType!,
                                rebateRemark: "",
                            );
                            _sendRebateRequestData(data);
                            setState(() {
                              data = null;
                            });
                          });
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
          _sentRequest
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Rebate Request sent Successfully"),
            ],
          )
              : SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
