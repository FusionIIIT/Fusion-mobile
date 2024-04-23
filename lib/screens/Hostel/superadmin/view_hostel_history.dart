import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';

class ViewHostelHistoryScreen extends StatefulWidget {
  const ViewHostelHistoryScreen({Key? key}) : super(key: key);

  @override
  _ViewHostelHistoryScreenState createState() => _ViewHostelHistoryScreenState();
}

class _ViewHostelHistoryScreenState extends State<ViewHostelHistoryScreen> {
  String _selectedHall = 'Hall 1'; // Default selected hall
  static const Map<String, dynamic>? hostelHistoryData = {
    "Hall 1": [
      {
        "hall": "Hall 1",
        "batch": "2019",
        "caretaker": "Pankaj",
        "warden": "None",
        "date": "2024-04-18"
      },
      {
        "hall": "Hall 1",
        "batch": "2020",
        "caretaker": "Pankaj",
        "warden": "None",
        "date": "2024-04-18"
      }
    ],
    "Hall 2": [
      {
        "hall": "Hall 2",
        "batch": "2019",
        "caretaker": "Anita",
        "warden": "None",
        "date": "2024-04-18"
      },
      {
        "hall": "Hall 2",
        "batch": "2020",
        "caretaker": "Anita",
        "warden": "None",
        "date": "2024-04-18"
      }
    ],
    // Add more hostel histories as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('View Hostel History - $_selectedHall'), // Display selected hall
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: _selectedHall,
              onChanged: (newValue) {
                setState(() {
                  _selectedHall = newValue!;
                });
              },
              items: hostelHistoryData?.keys.map((hall) {
                return DropdownMenuItem<String>(
                  value: hall,
                  child: Text(hall),
                );
              }).toList(),
            ),
          ),
          Card(
            elevation: 3,
            margin: EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                },
                children: [
                  _buildTableRow('Hall', 'Batch', 'Caretaker', 'Warden', 'Date'),
                  ..._buildRows(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TableRow> _buildRows() {
    List<TableRow> rows = [];
    hostelHistoryData?[_selectedHall]?.forEach((history) {
      rows.add(
        TableRow(
          children: [
            _buildTableCell(history['hall']),
            _buildTableCell(history['batch']),
            _buildTableCell(history['caretaker']),
            _buildTableCell(history['warden']),
            _buildTableCell(history['date']),
          ],
        ),
      );
    });
    return rows;
  }

  Widget _buildTableCell(String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(value),
    );
  }

  TableRow _buildTableRow(String hall, String batch, String caretaker, String warden, String date) {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey[300]),
      children: [
        _buildTableCell(hall),
        _buildTableCell(batch),
        _buildTableCell(caretaker),
        _buildTableCell(warden),
        _buildTableCell(date),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ViewHostelHistoryScreen(),
  ));
}
