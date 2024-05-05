import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fusion/screens/Placement/tpo/placement_charts.dart';
import 'package:fusion/screens/Placement/tpo/tpo_sidebar.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';
import 'package:fusion/Components/appBar2.dart';

class PlacementStatistics extends StatefulWidget {
  @override
  State<PlacementStatistics> createState() => _PlacementStatisticsState();
}

class _PlacementStatisticsState extends State<PlacementStatistics> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  int _graphValue = 2011;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Alumni Data",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });

        },
      ), // This is default app bar used in all modules
      bottomNavigationBar:
      MyBottomNavigationBar(),
      drawer: Sidebar(),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Select Year '),
              ),
              DropdownButton<int>(
                value: _graphValue,
                items: <DropdownMenuItem<int>>[
                  for (int year = 2010; year <= 2023; year++)
                    DropdownMenuItem(
                      value: year,
                      child: Text('$year'),
                    ),
                ],
                onChanged: (int? value) =>
                    setState(() => _graphValue = value!),
              ),
            ],
          ),
          Expanded(child: _buildGraph()),
        ],
      ),
    );
  }

  Widget _buildGraph() {
    switch (_graphValue) {
      case 2011:
        return EmptyGraphs();
      default:
        return StatsCharts(year: _graphValue);
    }
  }
}

class EmptyGraphs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}

class StatsCharts extends StatelessWidget {
  final int year;

  StatsCharts({Key? key, required this.year}) : super(key: key);

  final Random rnd = new Random();
  late List<PlacementData> data = [
    PlacementData(
        branch: 'CSE',
        placements:rnd.nextInt(250),
        barColor: charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent)),
    PlacementData(
        branch: 'ECE',
        placements: rnd.nextInt(120),
        barColor: charts.ColorUtil.fromDartColor(Colors.orangeAccent)),
    PlacementData(
        branch: 'ME',
        placements: rnd.nextInt(90),
        barColor: charts.ColorUtil.fromDartColor(Colors.tealAccent)),
    PlacementData(
        branch: 'SM',
        placements: rnd.nextInt(90),
        barColor: charts.ColorUtil.fromDartColor(Colors.indigoAccent)),
  ];

  @override
  Widget build(BuildContext context) {
    return PlacementCharts(data: data);
  }
}