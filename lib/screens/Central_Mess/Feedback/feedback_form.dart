
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:date_field/date_field.dart';
import 'package:fusion/services/central_mess_services.dart';
import 'package:fusion/models/central_mess.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  CentralMessService _centralMessService = CentralMessService();
  TextEditingController textController = TextEditingController();

  bool _loading = false; // Added _loading variable
  bool _sentFeedback = false;
  MessFeedback? data;
  String? selectedMess, selectedDay, selectedFeedbackType, description;

  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    // _fetchFeedbackData();
  }

  void _sendFeedbackData(data) async {
    try {
      setState(() {
        _loading = true; // Set loading state to true before sending request
      });

      http.Response menuItems = await _centralMessService.sendFeedback(data);
      if (menuItems.statusCode == 200) {
        print('Sent the feedback');
        setState(() {
          // Reset form fields after successful submission
          _sentFeedback = true;
          selectedMess = null;
          selectedDate = null;
          selectedFeedbackType = null;
          textController.text = '';
        });
        _showSuccessSnackbar();
      } else {
        print('Couldn\'t send');
      }
    } catch (e) {
      print('Error sending Feedback: $e');
      _showFailureSnackbar();
    } finally {
      setState(() {
        _loading = false; // Set loading state to false after request completion
      });
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

  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Feedback Submitted Successfully',
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
          'Failed to submit Feedback. Please try again later.',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red, // Set background color to red for failure
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _messFormKey = GlobalKey<FormState>();
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
                      items: [
                        DropdownMenuItem(
                            child: Text("Central Mess 1"),
                            value: "mess1"),
                        DropdownMenuItem(
                            child: Text("Central Mess 2"),
                            value: "mess2"),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    DateTimeFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Select Date',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      // autovalidateMode: AutovalidateMode.always,
                      // initialValue: DateTime.now(), // Set initial date
                      validator: (e) =>
                      e == null ? 'Select date' : null,
                      onDateSelected: (DateTime value) {
                        selectedDate = value;
                      },
                      firstDate: DateTime.now()  , // Allow dates starting from tomorrow
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Type of Feedback',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Type of Feedback" : null,
                      dropdownColor: Colors.white,
                      value: selectedFeedbackType,
                      onChanged: (String? newValue) {
                          selectedFeedbackType = newValue!;
                      },
                      items: [
                        DropdownMenuItem(
                            child: Text("Cleanliness"), value: "Cleanliness"),
                        DropdownMenuItem(
                            child: Text("Food Quality"), value: "Food Quality"),
                        DropdownMenuItem(
                            child: Text("Maintenance"), value: "Maintenance"),
                        DropdownMenuItem(child: Text("Others"), value: "Others"),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      maxLines: 4,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: 'Feedback',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: textController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Feedback";
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      style: style,
                      onPressed: _loading ? null : () {
                        if (_messFormKey.currentState!.validate()) {
                          setState(() {
                            data = MessFeedback(
                              mess: selectedMess!,
                              messRating: 5,
                              fdate: selectedDate!,
                              description: textController.text,
                              feedbackType: selectedFeedbackType!,
                            );
                          });
                          _sendFeedbackData(data);
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
