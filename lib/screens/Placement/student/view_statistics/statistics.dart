import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/constants.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}


class _StatisticsPageState extends State<StatisticsPage> {
  String selectedBranch = 'CSE'; // Default selected branch

  // Dummy list of years
  List<int> years = [2022, 2023, 2024]; // Example years

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  value: selectedBranch,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBranch = newValue!;
                    });
                  },
                  items: <String>['CSE', 'ECE', 'SM', 'Design', 'ME']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(width: 20),
                DropdownButton<int>(
                  value: years.first,
                  onChanged: (int? newValue) {
                    setState(() {
                      // Handle year change
                    });
                  },
                  items: years.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle search button press
                  },
                  child: Text('Search'),
                ),
              ],
            ),
          ),
          // Add statistics widgets here
        ],
      ),
    );
  }
}
