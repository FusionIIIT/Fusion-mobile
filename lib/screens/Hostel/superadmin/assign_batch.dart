import 'package:flutter/material.dart';

class AssignBatchScreen extends StatefulWidget {
  const AssignBatchScreen({Key? key}) : super(key: key);

  @override
  _AssignBatchScreenState createState() => _AssignBatchScreenState();
}

class _AssignBatchScreenState extends State<AssignBatchScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedHall;
  String? _batchID;

  final List<String> _hallList = ['Hall 1', 'Hall 2', 'Hall 3', 'Hall 4', 'Hall 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assign Batch'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47), // Background color
        foregroundColor: Colors.white, // Foreground color (for back button and title)
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
                    'Assign Batch',
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
                      labelText: 'Batch ID',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Batch ID';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _batchID = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _assignBatch();
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

  void _assignBatch() {
    // Simulate assigning batch logic
    // Replace this with actual logic to assign batch
    String message = 'Batch successfully assigned to $_selectedHall';
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
