import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

void main() {
  runApp(RequestsUI());
}

class RequestsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Requests:',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: DefaultAppBar().buildAppBar(),
        drawer: SideDrawer(),
        body: RequestForm(),
      ),
    );
  }
}

class RequestForm extends StatefulWidget {
  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  String _selectedRecipient = 'Director';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title moved from app bar to the body
            Text(
              'Requests',
              style: TextStyle(
                fontSize: 20.0, // Increase font size for title
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'Name:',
              style: TextStyle(fontSize: 18.0),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18.0),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter description',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Area:',
              style: TextStyle(fontSize: 18.0),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter area',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Send to:',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<String>(
              value: _selectedRecipient,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRecipient = newValue!;
                });
              },
              items: <String>[
                'Director',
                'Dean',
                'Junior Engineer',
                'Executive Engineer',
                'Electrical AE',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 100.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality for submit button
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12.0),
                  ),
                  child: Text('Submit', style: TextStyle(fontSize: 14.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
