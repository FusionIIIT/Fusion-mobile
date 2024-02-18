import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConfigurePreRegistration extends StatefulWidget {
  @override
  _ConfigurePreRegistration createState() => _ConfigurePreRegistration();
}

class _ConfigurePreRegistration extends State<ConfigurePreRegistration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed with API call
      final startDate = _startDateController.text;
      final endDate = _endDateController.text;

      // Assuming you have an API endpoint to post the data to
      final apiUrl = 'YOUR_API_ENDPOINT_HERE';
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode({'start_date': startDate, 'end_date': endDate}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Handle success
        print('Data posted successfully');
      } else {
        // Handle error
        print('Failed to post data');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _startDateController,
            decoration: InputDecoration(
              labelText: 'Start Date',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a start date';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _endDateController,
            decoration: InputDecoration(
              labelText: 'End Date',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an end date';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}