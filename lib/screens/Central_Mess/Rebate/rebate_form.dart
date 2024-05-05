
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

  bool _sentRequest = false, _updateDish = false, _loading = false;
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
      setState(() {
        _loading = true; // Set loading state to true before sending request
      });
      http.Response menuItems =
      await _centralMessService.sendRebateRequest(data);
      if (menuItems.statusCode == 200) {
        print('Sent the Rebate request');
        setState(() {
          _sentRequest = true;
          _loading = false; // Set loading state to false after successful request
        });
        _showSuccessSnackbar();
        // Reset all fields to null after successful request
        setState(() {
          selectedType = null;
          selectedDateStart = null;
          selectedDateEnd = null;
          _reasonController.clear();
        });
      } else {
        print('Couldn\'t send');
        setState(() {
          _loading = false; // Set loading state to false after failed request
        });
        _showFailureSnackbar();
      }
    } catch (e) {
      print('Error sending Rebate Request: $e');
      setState(() {
        _loading = false; // Set loading state to false if there's an error
      });
      _showFailureSnackbar();
    }
  }

  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Rebate Request sent Successfully',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.green, // Set background color to green for success
      ),
    );
  }

  void _showFailureSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Try again after some time !!!',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red, // Set background color to red for failure
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose(); // Dispose the controller
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
                            child: Text("Vacation"), value: "vacation"),
                        DropdownMenuItem(
                            child: Text("Casual"), value: "casual"),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    DateTimeFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Select Start Date',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: selectedDateStart,
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
                      firstDate: DateTime.now(),
                    ),
                    SizedBox(height: 10.0),
                    DateTimeFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Select End Date',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
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
                      firstDate: DateTime.now(),
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
                        errorText: _updateDish &&
                            (reasonForRebate == null ||
                                reasonForRebate!.isEmpty)
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
                      onPressed: _loading
                          ? null
                          : () {
                        setState(() {
                          _updateDish = true;
                        });
                        if (_messFormKey.currentState!.validate()) {
                          setState(() {
                            data = Rebate(
                              startDate: selectedDateStart!,
                              endDate: selectedDateEnd!,
                              purpose: _reasonController.text,
                              status: "1",
                              appDate: DateTime.now(),
                              leaveType: selectedType!,
                              rebateRemark: "",
                            );
                            _sendRebateRequestData(data);
                            _updateDish = false;
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
