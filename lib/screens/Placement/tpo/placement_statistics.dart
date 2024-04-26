import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fusion/screens/Placement/tpo/placement_charts.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/screens/Placement/tpo/tpo_sidebar.dart';

class PlacementStatistics extends StatefulWidget {
  @override
  State<PlacementStatistics> createState() => _PlacementStatisticsState();
}

class _PlacementStatisticsState extends State<PlacementStatistics> {
  int _graphValue = 2011;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Placement Statistics'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
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