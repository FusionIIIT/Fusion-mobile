import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';

class Fines extends StatelessWidget {
  const Fines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // JSON data representing fines
    const String fineData = '''
    {
      "MyFine": [
        {
          "hall": "4",
          "amount": 200,
          "status": "paid",
          "reason": "Hall fee payment",
          "action": "done"
        },
        {
          "hall": "4",
          "amount": 50,
          "status": "unpaid",
          "reason": "Using unauthorized appliance (fan)",
          "action": "pay"
        },
        {
          "hall": "4",
          "amount": 500,
          "status": "unpaid",
          "reason": "Damage to hall property",
          "action": "pay"
        },
        {
          "hall": "4",
          "amount": 100,
          "status": "unpaid",
          "reason": "Violation of hall rules",
          "action": "pay"
        }
      ]
    }
    ''';

     final Map<String, dynamic> fines = json.decode(fineData);

    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('Fines'),
        backgroundColor: const Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Fines',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: fines['MyFine'].length,
                itemBuilder: (context, index) {
                  var fine = fines['MyFine'][index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hall: ${fine['hall']}'),
                          Text('Amount: \$${fine['amount']}'),
                          Text(
                            'Status: ${fine['status'].toString().toUpperCase()}',
                            style: TextStyle(
                              color: fine['status'] == 'unpaid'
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                          Text('Reason: ${fine['reason']}'),
                          if (fine['status'] == 'unpaid')
                            ElevatedButton(
                              onPressed: () {
                                // Implement action for unpaid fine
                              },
                              child: Text(fine['action'].toString()),
                            ),
                        ],
                      ),
                    ),
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

void main() {
  runApp(MaterialApp(home: Fines()));
}