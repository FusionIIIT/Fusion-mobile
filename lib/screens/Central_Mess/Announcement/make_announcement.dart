
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class MakeAnnouncement extends StatefulWidget {
  @override
  _MakeAnnouncementState createState() => _MakeAnnouncementState();
}

class _MakeAnnouncementState extends State<MakeAnnouncement> {
  final _announcementTextController = TextEditingController();
  bool _loading = false;
  String? selectedMess, selectedMeal, announcementText;
  DateTime? selectedDate;

  final _messFormKey = GlobalKey<FormState>();

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.deepOrangeAccent,
        width: 2.0,
        style: BorderStyle.solid,
      ),
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

  void _submitAnnouncement() {
    if (_messFormKey.currentState!.validate()) {
      setState(() {
        _loading = true; // Set loading state to true before sending request
      });

      // Simulate API call or perform other actions here
      Future.delayed(Duration(seconds: 2), () {
        // Reset fields after successful submission
        setState(() {
          selectedMess = null;
          selectedMeal = null;
          selectedDate = null;
          announcementText = null;
          _loading = false; // Set loading state to false after successful request
          _announcementTextController.clear();
        });
        _showSuccessSnackbar();
      });
    }
  }

  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Announcement Submitted Successfully',
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
          'Failed to send Special Request. Please try again later.',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red, // Set background color to red for failure
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
                          selectedMess = newValue; // Update selectedMess
                        });
                      },
                      items: [
                        DropdownMenuItem(
                            child: Text("Central Mess 1"), value: "mess1"),
                        DropdownMenuItem(
                            child: Text("Central Mess 2"), value: "mess2"),
                        DropdownMenuItem(
                            child: Text("All"), value: "all"),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    DateTimeFormField(
                      decoration: InputDecoration(
                        labelText: 'Select date',
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
                      (e?.day ?? 0) == 1 ? 'Select date' : null,
                      onDateSelected: (DateTime value) {
                        selectedDate = value;
                      },
                      firstDate: DateTime.now(),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Subject of Announcement',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepOrangeAccent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) =>
                      value == null ? "Subject of Announcement" : null,
                      dropdownColor: Colors.white,
                      value: selectedMeal,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMeal = newValue; // Update selectedMeal
                        });
                      },
                      items: [
                        DropdownMenuItem(
                            child: Text("Change in Mess Time"),
                            value: "Change in Mess Time"),
                        DropdownMenuItem(
                            child: Text("Change in Mess Menu"),
                            value: "Change in Mess Menu"),
                        DropdownMenuItem(child: Text("Other"), value: "Other"),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _announcementTextController,
                      maxLines: 4,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        labelText: 'Write Announcement',
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
                          return "Write Announcement";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          announcementText = value; // Update announcementText
                        });
                      },
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 30.0,),
                    ElevatedButton(
                      style: style,
                      onPressed: _loading ? null : _submitAnnouncement,
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

