import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:http/http.dart' as http;
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/central_mess.dart';

class VacationFoodForm extends StatefulWidget {
  @override
  _VacationFoodFormState createState() => _VacationFoodFormState();
}

class _VacationFoodFormState extends State<VacationFoodForm> {

  CentralMessService _centralMessService = CentralMessService();
  TextEditingController textController = TextEditingController();

  bool _loading = false, _sentRequest = false, _updateDish = false;
  // Vacation? data;
  String? purpose, selectedMess;
  DateTime? selectedDateStart, selectedDateEnd;

  final _messFormKey = GlobalKey<FormState>();
  final _vacationController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // void _sendVacationRequestData(data) async {
  //   try {
  //     http.Response menuItems = await _centralMessService.sendVacationRequest(data);
  //     if (menuItems.statusCode == 200) {
  //       print('Sent the Vacation request');
  //       setState(() {
  //         _sentRequest = true;
  //       });
  //     } else {
  //       print('Couldn\'t send');
  //     }
  //   } catch (e) {
  //     print('Error sending Vacation Request: $e');
  //   }
  // }

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
  List<Map<String, String>> menuDropDownItems = [
    {"text": "Mess 1", "value": "mess1"},
    {"text": "Mess 2", "value": "mess2"},
  ];

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
                        labelText: 'Select a Mess',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Select a mess" : null,
                      dropdownColor: Colors.white,
                      value: selectedMess,
                      onChanged: (String? newValue) {
                        // setState(() {
                        selectedMess = newValue!;
                        // });
                      },
                      items: menuDropDownItems.map((item) {
                        return DropdownMenuItem(
                          child: Text(item["text"]!),
                          value: item["value"],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    DateTimeFormField(
                        decoration: InputDecoration(
                          labelText: 'Select Start Date',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrangeAccent, width: 2),
                            borderRadius: BorderRadius.circular(15),
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
                            borderRadius: BorderRadius.circular(15),
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
                      controller: _vacationController,
                      maxLines: 2,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: 'Purpose',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        errorText: _updateDish && (purpose == null || purpose!.isEmpty)
                            ? 'Enter a purpose'
                            : null,
                      ),
                      onChanged: (value) {
                        setState(() {
                          purpose = value;
                        });
                      },
                      style: TextStyle(fontSize: 18.0),
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
                          print({selectedMess, selectedDateStart, selectedDateEnd, _vacationController.text, DateTime.now()});
                          setState(() {
                            // data = Vacation(
                            //   // studentId: studentId,
                            //   startDate: selectedDateStart!,
                            //   endDate: selectedDateEnd!,
                            //   purpose: _vacationController.text,
                            //   status: "1",
                            //   appDate: DateTime.now(),
                            //   leaveType: selectedMess!,
                            //   VacationRemark: "",
                            // );
                            // _sendVacationRequestData(data);
                            // setState(() {
                            //   data = null;
                            // });
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
              Text("Vacation Request sent Successfully"),
            ],
          )
              : SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
