
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

  bool _requestSent = false, _loading = false;
  SpecialRequest? data;
  String? selectedMess, mealTime, foodItem, purpose;
  DateTime? fromDate, toDate;

  final _messFormKey = GlobalKey<FormState>();
  final _purposeController = TextEditingController();
  final _foodItemController = TextEditingController();

  void _sendSpecialRequestData(SpecialRequest data) async {
    try {
      setState(() {
        _loading = true;
      });
      http.Response menuItems = await _centralMessService.sendSpecialRequest(data);
      if (menuItems.statusCode == 200) {
        print('Sent the special request');
        setState(() {
          _requestSent = true;
          _loading = false;
          // Reset all fields after successful submission
          selectedMess = null;
          mealTime = null;
          fromDate = null;
          toDate = null;
          purpose = null;
          foodItem = null;
          _purposeController.clear();
          _foodItemController.clear();
        });
        _showSuccessSnackBar();
      } else {
        print('Couldn\'t send');
        setState(() {
          _loading = false;
        });
        _showFailureSnackBar();
      }
    } catch (e) {
      print('Error sending Special Request: $e');
      setState(() {
        _loading = false; // Set loading state to false if there's an error
      });
      _showFailureSnackBar();
    }
  }

  void _showSuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Special Request Sent Successfully',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.green, // Set background color to green for success
      ),
    );
  }

  void _showFailureSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Failed to send Special Request. Please try again later.',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red, // Set background color to red for failure
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
  void dispose() {
    _purposeController.dispose(); // Dispose the controller
    super.dispose();
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
                    DateTimeFormField(
                      decoration: InputDecoration(
                        labelText: 'From date',
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialDate: fromDate,
                      validator: (fromDateValue) {
                        if (fromDateValue == null) return 'Select from date';
                        if (toDate != null && fromDateValue.isAfter(toDate!)) {
                          return 'From date cannot be after to date';
                        }
                        return null;
                      },
                      onDateSelected: (DateTime value) {
                        setState(() {
                          fromDate = value;
                        });
                      },
                      firstDate: DateTime.now(),
                    ),
                    SizedBox(height: 10.0),
                    DateTimeFormField(
                      decoration: InputDecoration(
                        labelText: 'To date',
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialDate: toDate,
                      validator: (toDateValue) {
                        if (toDateValue == null) return 'Select to date';
                        if (fromDate != null && toDateValue.isBefore(fromDate!)) {
                          return 'To date cannot be before from date';
                        }
                        return null;
                      },
                      onDateSelected: (DateTime value) {
                        setState(() {
                          toDate = value;
                        });
                      },
                      firstDate: DateTime.now(),
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
                        setState(() {
                          selectedMess = newValue!;
                        });
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
                        setState(() {
                          mealTime = newValue!;
                        });
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
                      controller: _purposeController,
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
                          return "Enter a purpose";
                        }
                        return null;
                      },
                      onChanged: (String? newValue) {
                        setState(() {
                          purpose = newValue!;
                        });
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _foodItemController,
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
                        setState(() {
                          foodItem = newValue!;
                        });
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      style: style,
                      onPressed: _loading
                          ? null
                          : () {
                        if (_messFormKey.currentState!.validate()) {
                          // Handle valid flow
                          data = SpecialRequest(
                            startDate: fromDate!,
                            endDate: toDate!,
                            request: purpose!,
                            status: "1",
                            item1: foodItem!,
                            item2: mealTime!,
                            appDate: DateTime.now(),
                          );
                          _sendSpecialRequestData(data!);
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text("Request"),
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
