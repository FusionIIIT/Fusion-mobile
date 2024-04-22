import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';

class ViewHostelScreen extends StatelessWidget {
  const ViewHostelScreen({Key? key}) : super(key: key);

  // Define the hostel data
  static const List<Map<String, dynamic>> hostelData = [
    {
  "hostels": [
    {
      "hallId": "1",
      "hallName": "Hall 1",
      "seaterType": "single",
      "maxAccommodation": 400,
      "occupied": 400,
      "vacantSeats": 0,
      "assignedBatch": "2019",
      "assignedCaretaker": "None",
      "assignedWardenID": "None"
    },
    {
      "hallId": "2",
      "hallName": "Hall 2",
      "seaterType": "single",
      "maxAccommodation": 500,
      "occupied": 400,
      "vacantSeats": 100,
      "assignedBatch": "2021",
      "assignedCaretaker": "shyam",
      "assignedWardenID": "GD"
    },
    {
      "hallId": "3",
      "hallName": "Hall 3",
      "seaterType": "single",
      "maxAccommodation": 400,
      "occupied": 380,
      "vacantSeats": 20,
      "assignedBatch": "2019",
      "assignedCaretaker": "pankaj",
      "assignedWardenID": "None"
    }
  ]
}

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('View Hostel'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Hostel List',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Hall ID')),
                    DataColumn(label: Text('Hall Name')),
                    DataColumn(label: Text('Seater Type')),
                    DataColumn(label: Text('Max Accommodation')),
                    DataColumn(label: Text('Occupied')),
                    DataColumn(label: Text('Vacant Seats')),
                    DataColumn(label: Text('Assigned Batch')),
                    DataColumn(label: Text('Assigned Caretaker')),
                    DataColumn(label: Text('Assigned Warden ID')),
                  ],
                  rows: hostelData.map<DataRow>((data) {
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(Text(data['hallId'])),
                        DataCell(Text(data['hallName'])),
                        DataCell(Text(data['seaterType'])),
                        DataCell(Text(data['maxAccommodation'].toString())),
                        DataCell(Text(data['occupied'].toString())),
                        DataCell(Text(data['vacantSeats'].toString())),
                        DataCell(Text(data['assignedBatch'])),
                        DataCell(Text(data['assignedCaretaker'])),
                        DataCell(Text(data['assignedWardenID'])),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
