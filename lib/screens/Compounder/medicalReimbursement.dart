import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reimbursement Form Status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ReimbursementPage(),
    );
  }
}

class ReimbursementPage extends StatefulWidget {
  @override
  _ReimbursementPageState createState() => _ReimbursementPageState();
}

class _ReimbursementPageState extends State<ReimbursementPage> {
  String? selectedRollNumber;
  String? formStatus ;
  List<String> rollNumbers = ['Roll 1', 'Roll 2', 'Roll 3']; // Sample roll numbers

  List<Map<String, String>> previousEntries = [];

  void addNewEntry() {
    if (selectedRollNumber!.isNotEmpty && formStatus!.isNotEmpty) {
      setState(() {
        previousEntries.add({
          'Roll Number': selectedRollNumber!,
          'Status': formStatus!,
        });
      });
    }
  }

  void updateStatus(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select new status:'),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: previousEntries[index]['Status'],
                items: ['Received', 'Verified', 'Forwarded to DSA']
                    .map((String status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    previousEntries[index]['Status'] = value!;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reimbursement Form Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Select Roll Number'),
              value: selectedRollNumber,
              items: rollNumbers.map((String rollNumber) {
                return DropdownMenuItem<String>(
                  value: rollNumber,
                  child: Text(rollNumber),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedRollNumber = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Form Status:',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      formStatus = 'Received';
                    });
                  },
                  child: Text('Received'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      formStatus = 'Verified';
                    });
                  },
                  child: Text('Verified'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      formStatus = 'Forwarded to DSA';
                    });
                  },
                  child: Text('Forwarded to DSA'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addNewEntry();
              },
              child: Text('Add New Entry'),
            ),
            SizedBox(height: 20),
            Text(
              'Previous Entries:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: previousEntries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Roll Number: ${previousEntries[index]['Roll Number']} - Status: ${previousEntries[index]['Status']}',
                    ),
                    onTap: () {
                      updateStatus(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
