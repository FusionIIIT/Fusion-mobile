import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fusion/screens/Placement_Cell/Placement_Charts.dart';
import 'package:fusion/constants.dart';

class BatchStatistics extends StatefulWidget {
  @override
  State<BatchStatistics> createState() => _BatchStatisticsState();
}

class _BatchStatisticsState extends State<BatchStatistics> {

  int _graphValue = 2011;
  String _value = 'Batch Statistics';
  Widget graphs = EmptyGraphs();
  @override
  Widget build(BuildContext context) {
    switch(_graphValue){
      case 2011:
        graphs = EmptyGraphs();
        break;
      default:
        graphs = StatsCharts();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DropdownButton<String>(
              value: _value,
              style:  TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              focusColor: kPrimaryColor,
              dropdownColor: kPrimaryColor,
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  value: 'Placement Schedule',
                  child: Text(
                    'Placement Schedule',
                  ),
                ),
                DropdownMenuItem(
                    value: 'Add Placement Record', child: Text('Add Placement Record')
                ),
                DropdownMenuItem(
                    value: 'Add Event', child: Text('Add Event')
                ),DropdownMenuItem(
                    value: 'Past Records', child: Text('Past Records')
                ),DropdownMenuItem(
                    value: 'Batch Statistics', child: Text('Batch Statistics')
                ),

              ],

              onChanged: (String? value) {
                setState((){
                  _value = value!;
                  switch(_value){
                    case 'Placement Schedule':
                      Navigator.pushReplacementNamed(context, '/placement_cell/placement_cell_home');
                      break;
                    case 'Add Placement Record':
                      Navigator.pushReplacementNamed(context, '/placement_cell/add_placement_record');
                      break;
                    case 'Add Event':
                      Navigator.pushReplacementNamed(context, 'placement_cell/add_event');
                      break;
                    case 'Batch Statistics':
                      Navigator.pushReplacementNamed(context, '/placement_cell/batch_statistics');
                      break;
                    case 'Past Records':
                      Navigator.pushReplacementNamed(context, '/placement_cell/past_records');
                      break;
                    default:
                      break;
                  }

                });
              },
            ),
          ],
        ),
      ),
        drawer: SideDrawer(),
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
                    setState(() => _graphValue = value!)
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
  Random rnd = new Random();
  int next(int min, int max) => min + rnd.nextInt(max - min);
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
