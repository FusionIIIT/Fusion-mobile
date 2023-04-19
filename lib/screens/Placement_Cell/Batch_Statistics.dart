import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fusion/screens/Placement_Cell/Placement_Charts.dart';

class BatchStatistics extends StatefulWidget {
  @override
  State<BatchStatistics> createState() => _BatchStatisticsState();
}

class _BatchStatisticsState extends State<BatchStatistics> {
  int _value = 2011;
  Widget graphs = EmptyGraphs();
  @override
  Widget build(BuildContext context) {
    switch(_value){
      case 2011:
        graphs = EmptyGraphs();
        break;
      default:
        graphs = StatsCharts();
        break;
    }

    return Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Select Year '),
                ),
                DropdownButton<int>(
                  value: _value,
                  items: <DropdownMenuItem<int>>[
                    DropdownMenuItem(
                      value: 2010,
                      child: Text('2010'),
                    ),
                    DropdownMenuItem(
                      value: 2011,
                      child: Text('2011'),
                    ),
                    DropdownMenuItem(
                      value: 2012,
                      child: Text('2012'),
                    ),
                    DropdownMenuItem(
                      value: 2013,
                      child: Text('2013'),
                    ),
                    DropdownMenuItem(
                      value: 2014,
                      child: Text('2014'),
                    ),
                    DropdownMenuItem(
                      value: 2015,
                      child: Text('2015'),
                    ),
                    DropdownMenuItem(
                      value: 2016,
                      child: Text('2016'),
                    ),
                    DropdownMenuItem(
                      value: 2017,
                      child: Text('2017'),
                    ),
                    DropdownMenuItem(
                      value: 2018,
                      child: Text('2018'),
                    ),
                    DropdownMenuItem(
                      value: 2019,
                      child: Text('2019'),
                    ),
                    DropdownMenuItem(
                      value: 2020,
                      child: Text('2020'),
                    ),
                    DropdownMenuItem(
                      value: 2021,
                      child: Text('2021'),
                    ),
                    DropdownMenuItem(
                      value: 2022,
                      child: Text('2022'),
                    ),
                  ],
                  onChanged: (int? value) => {
                    setState(() => _value = value!)
                  },
      ),
              ],
            ),
            SizedBox(
                height: 600,
                child: graphs
            )
          ],
        ),
    );
  }
}

class EmptyGraphs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
  
}

class StatsCharts extends StatelessWidget{
  final List<PlacementData> data = [
    PlacementData(branch: 'CSE', placements: 225, barColor: charts.ColorUtil.fromDartColor(Colors.blueAccent)),
    PlacementData(branch: 'ECE', placements: 125, barColor: charts.ColorUtil.fromDartColor(Colors.redAccent)),
    PlacementData(branch: 'ME', placements: 75, barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent)),
    PlacementData(branch: 'SM', placements: 55, barColor: charts.ColorUtil.fromDartColor(Colors.yellowAccent)),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PlacementCharts(data: data),
        ],
      ),
    );
  }

}
