import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'dart:convert';
import 'dart:math';

class Er_Process_Request extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: RequestsPage());
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RequestsPage(), // Changed the page to RequestsPage
  ));
}

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  List<Map<String, dynamic>> _requestData = [];

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
      {
        'id': 1,
        'name': 'Request 1',
        'description': 'Description 1',
        'area': 'Area A',
        'createdBy': 'User 1',
      },
      {
        'id': 2,
        'name': 'Request 2',
        'description': 'Description 2',
        'area': 'Area B',
        'createdBy': 'User 2',
      },
      {
        'id': 3,
        'name': 'Request 3',
        'description': 'Description 3',
        'area': 'Area C',
        'createdBy': 'User 3',
      },
      {
        'id': 4,
        'name': 'Request 4',
        'description': 'Description 4',
        'area': 'Area D',
        'createdBy': 'User 4',
      },
      {
        'id': 5,
        'name': 'Request 5',
        'description': 'Description 5',
        'area': 'Area E',
        'createdBy': 'User 5',
      },
    ];

    setState(() {
      _requestData = responseData; // Update state with fetched data
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
                  'Engineer Processed Requests',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 74, 73, 73),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                    DataColumn(label: Text('Description')),
                    DataColumn(label: Text('Area')),
                    DataColumn(label: Text('Created By')),
                  ],
                  rows: _requestData
                      .map(
                        (data) => DataRow(
                          cells: [
                            DataCell(Text(data['id'].toString())),
                            DataCell(Text(data['name'].toString())),
                            DataCell(Text(data['description'].toString())),
                            DataCell(Text(data['area'].toString())),
                            DataCell(Text(data['createdBy'].toString())),
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
