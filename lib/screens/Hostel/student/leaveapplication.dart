import 'package:flutter/material.dart';

class Leaveapplication extends StatefulWidget {
  const Leaveapplication({Key? key}) : super(key: key);

  @override
  _LeaveapplicationState createState() => _LeaveapplicationState();
}

class _LeaveapplicationState extends State<Leaveapplication> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? studentName;
  String? rollNumber;
  String? phoneNumber;
  String? reason;
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave Application'),
        backgroundColor: const Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Student Name'),
                    onSaved: (String? value) {
                      studentName = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Roll Number'),
                    onSaved: (String? value) {
                      rollNumber = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Phone Number'),
                    onSaved: (String? value) {
                      phoneNumber = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Reason'),
                    onSaved: (String? value) {
                      reason = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null) {
                        setState(() {
                          startDate = picked;
                        });
                      }
                    },
                    child: Text(
                      startDate != null
                          ? 'Start Date: ${startDate!.day}/${startDate!.month}/${startDate!.year}'
                          : 'Select Start Date',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null) {
                        setState(() {
                          endDate = picked;
                        });
                      }
                    },
                    child: Text(
                      endDate != null
                          ? 'End Date: ${endDate!.day}/${endDate!.month}/${endDate!.year}'
                          : 'Select End Date',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // TODO: Implement submit functionality
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
