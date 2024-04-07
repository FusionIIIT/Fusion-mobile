import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:date_field/date_field.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/central_mess.dart';

class ApplySpecialFood extends StatefulWidget {
  @override
  _ApplySpecialFoodState createState() => _ApplySpecialFoodState();
}

class _ApplySpecialFoodState extends State<ApplySpecialFood> {

  CentralMessService _centralMessService = CentralMessService();
  TextEditingController textController = TextEditingController();

  bool _loading = false, _requestSent = false;
  SpecialRequest? data;
  String? selectedMess, mealTime, foodItem, purpose;
  DateTime? fromDate, toDate;

  final _messFormKey = GlobalKey<FormState>();
  final _purposeController = TextEditingController();

  void _sendSpecialRequestData(data) async {
    try {
      http.Response menuItems = await _centralMessService.sendSpecialRequest(data);
      if (menuItems.statusCode == 200) {
        print('Sent the special request');
        setState(() {
          _requestSent = true;
        });
      } else {
        print('Couldn\'t send');
      }
    } catch (e) {
      print('Error sending Special Request: $e');
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
  List<Map<String, String>> menuDropDownItems = [
    {"text": "Mess 1", "value": "mess1"},
    {"text": "Mess 2", "value": "mess2"},
  ];
  List<Map<String, String>> mealTimeDropDownItems = [
    {"text": "Breakfast", "value": "Breakfast"},
    {"text": "Lunch", "value": "Lunch"},
    {"text": "Dinner", "value": "Dinner"},
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
                    DateTimeFormField(
                        decoration: InputDecoration(
                          labelText: 'From Date',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrangeAccent, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: Icon(Icons.event_note),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) =>
                        (e?.day ?? 0) == 1 ? 'Select from date' : null,
                        onDateSelected: (DateTime value) {
                          fromDate = value;
                        },
                        firstDate: DateTime.now()
                    ),
                    SizedBox(height: 10.0),
                    DateTimeFormField(
                        decoration: InputDecoration(
                          labelText: 'To Date',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrangeAccent, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: Icon(Icons.event_note),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) =>
                        (e?.day ?? 0) == 1 ? 'Select to date' : null,
                        onDateSelected: (DateTime value) {
                          toDate = value;
                        },
                        firstDate: DateTime.now()
                    ),
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
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Meal Timing',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Select a meal timing" : null,
                      dropdownColor: Colors.white,
                      value: mealTime,
                      onChanged: (String? newValue) {
                        // setState(() {
                        mealTime = newValue!;
                        // });
                      },
                      items: mealTimeDropDownItems.map((item) {
                        return DropdownMenuItem(
                          child: Text(item["text"]!),
                          value: item["value"],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      maxLines: 1,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: 'Purpose',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a new foodItem";
                        }
                        return null;
                      },
                      onChanged: (String? newValue) {
                        // setState(() {
                        purpose = newValue!;
                        // });
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),SizedBox(height: 10.0),
                    TextFormField(
                      controller: _purposeController,
                      maxLines: 3,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: 'Enter food item',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter food item!";
                        }
                        return null;
                      },
                      onChanged: (String? newValue) {
                        // setState(() {
                        foodItem = newValue!;
                        // });
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                        style: style,
                        onPressed: () {
                          if (_messFormKey.currentState!.validate()) {
                            // Handle valid flow
                            // print("Selected mess: $selectedValue");
                            // Now we can perform actions based on the selected mess

                            // print({fromDate, toDate, purpose, foodItem, mealTime});
                            setState(() {
                              data = SpecialRequest(
                                startDate: fromDate!,
                                endDate: toDate!,
                                request: purpose!,
                                status: "1",
                                item1: foodItem!,
                                item2: mealTime!,
                                appDate: DateTime.now(),
                              );
                              _sendSpecialRequestData(data);
                              setState(() {
                                data = null;
                              });
                            });
                          }
                        },
                        child: Text("Request"))
                  ],
                ),
              ),
            ),
          ),
          // updated successfully
          _requestSent
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Special Request sent Successfully"),
            ],
          )
              : SizedBox(height: 10.0),
        ],
      ),
    );
  }
}