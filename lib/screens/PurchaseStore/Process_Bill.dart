import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class ProcessBill extends StatefulWidget {
  @override
  _ProcessBillFormState createState() => _ProcessBillFormState();
}

class _ProcessBillFormState extends State<ProcessBill> {
  final _formKey = GlobalKey<FormState>();
  String _billAmount = '';
  String _department = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Process Bill'),
        backgroundColor: Colors.deepOrangeAccent,
      ),

      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the bill amount';
                  }
                  return null;
                },
                onSaved: (value) => _billAmount = value ?? '',
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the department';
                  }
                  return null;
                },
                onSaved: (value) => _department = value ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print('Bill Amount: $_billAmount');
                    print('Department: $_department');
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Process Bill',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'ProcessBill',
    home: ProcessBill(),
  ));
}
