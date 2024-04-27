import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'dart:convert';
import 'dart:math';

class Dean_budget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: BudgetPage());
  }
}

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  List<Map<String, dynamic>> _budgetData = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the page is initialized
  }

  Future<void> fetchData() async {
    // Simulate a network request delay of 2 seconds
    await Future.delayed(Duration(seconds: 2));

    // Simulated response data
    List<Map<String, dynamic>> responseData = [
      {'id': 1, 'name': 'John Doe', 'budget_issued': 1000},
      {'id': 2, 'name': 'Jane Smith', 'budget_issued': 2000},
      {'id': 3, 'name': 'Alice Johnson', 'budget_issued': 1500},
      {'id': 4, 'name': 'Bob Brown', 'budget_issued': 1800},
      {'id': 5, 'name': 'Eva Lee', 'budget_issued': 2200},
    ];

    setState(() {
      _budgetData = responseData; // Update state with fetched data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('IWD Department'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Budget',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 74, 73, 73),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepOrange),
                ),
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Budget Issued')),
                  ],
                  rows: _budgetData
                      .map(
                        (data) => DataRow(
                          cells: [
                            DataCell(Text(data['id'].toString())),
                            DataCell(Text(data['name'].toString())),
                            DataCell(Text(data['budget_issued'].toString())),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {
                    // Add your back button action here
                    print('Back button pressed');
                  },
                  child: Text(
                    'BACK',
                    style: TextStyle(
                      color: Colors.white,
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
