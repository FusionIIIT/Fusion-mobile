// assign_warden.dart
import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';

class AssignWardenScreen extends StatefulWidget {
  const AssignWardenScreen({Key? key}) : super(key: key);

  @override
  _AssignWardenScreenState createState() => _AssignWardenScreenState();
}

class _AssignWardenScreenState extends State<AssignWardenScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedHall;
  String? _wardenID;

  final List<String> _hallList = ['Hall 1', 'Hall 2', 'Hall 3', 'Hall 4', 'Hall 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('Assign Warden'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assign Warden',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Hall',
                      border: OutlineInputBorder(),
                    ),
                    value: _selectedHall,
                    items: _hallList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedHall = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a hall';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Warden ID',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Warden ID';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _wardenID = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _assignWarden();
                      }
                    },
                    child: Text('Assign'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 245, 103, 47),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _assignWarden() {
    // Simulate assigning warden logic
    // Replace this with actual logic to assign warden
    String message = 'Warden successfully assigned to $_selectedHall';
    _showSuccessSnackBar(message);
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
