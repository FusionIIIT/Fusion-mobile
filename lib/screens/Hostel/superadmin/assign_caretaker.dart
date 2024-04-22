import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';

class AssignCaretakerScreen extends StatefulWidget {
  const AssignCaretakerScreen({Key? key}) : super(key: key);

  @override
  _AssignCaretakerScreenState createState() => _AssignCaretakerScreenState();
}

class _AssignCaretakerScreenState extends State<AssignCaretakerScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedHall;
  String? _caretakerUsername;

  final List<String> _hallList = ['1', '2', '3', '4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('Assign Caretaker'),
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
                    'Assign Caretaker',
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
                        child: Text('Hall $value'),
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
                      labelText: 'Caretaker Username',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter caretaker username';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _caretakerUsername = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _assignCaretaker();
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

  void _assignCaretaker() {
    // Simulate assigning caretaker logic
    // Replace this with actual logic to assign caretaker
    String message = 'Caretaker successfully assigned to Hall $_selectedHall';
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
