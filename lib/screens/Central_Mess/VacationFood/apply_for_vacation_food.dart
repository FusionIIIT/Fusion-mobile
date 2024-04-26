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

  bool _sentRequest = false, _updateDish = false, _loading = false;
  VacationFood? data;
  String? purpose, selectedMess;
  DateTime? selectedDateStart, selectedDateEnd;

  final _messFormKey = GlobalKey<FormState>();
  final _vacationController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _sendVacationFoodRequestData(data) async {
    setState(() {
      _loading = true;
    });
    try {
      http.Response menuItems = await _centralMessService.sendVacationFoodRequest(data);
      if (menuItems.statusCode == 200) {
        print('Sent the Vacation Food request');
        setState(() {
          _sentRequest = true;
          _loading = false;
          selectedDateEnd = null;
          selectedDateStart = null;
          selectedMess = null;
          purpose = null;
          _updateDish = false; // Reset _updateDish flag
          _vacationController.clear();
        });
        _showSnackbar('Vacation Food request sent successfully', Colors.green);
      } else {
        print('Couldn\'t send');
        _showSnackbar('Failed to send request. Please try again later.', Colors.red);
      }
    } catch (e) {
      print('Error sending Vacation Food Request: $e');
      _showSnackbar('Failed to send request. Please try again later.', Colors.red);
    }
  }

  void _showSnackbar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: backgroundColor,
      ),
    );
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
                        selectedMess = newValue!;
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialDate: selectedDateStart,
                        validator: (selectedDateStart) {
                          if (selectedDateStart == null) return 'Select start date';
                          if (selectedDateEnd != null &&
                              selectedDateStart.isAfter(selectedDateEnd!)) {
                            return 'Start date cannot be after end date';
                          }
                          return null;
                        },
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: selectedDateEnd,
                        validator: (selectedDateEnd) {
                          if (selectedDateEnd == null) return 'Select end date';
                          if (selectedDateStart != null &&
                              selectedDateEnd.isBefore(selectedDateStart!)) {
                            return 'End date cannot be before start date';
                          }
                          return null;
                        },
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
                          setState(() {
                            data = VacationFood(
                              startDate: selectedDateStart!,
                              endDate: selectedDateEnd!,
                              purpose: _vacationController.text,
                              status: "1",
                              appDate: DateTime.now(),
                            );
                            _sendVacationFoodRequestData(data);
                          });
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text("Submit"),
                          if (_loading) CircularProgressIndicator(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
