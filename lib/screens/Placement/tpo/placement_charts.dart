import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PlacementData {
  final String branch;
  final int placements;
  final charts.Color barColor;
  PlacementData(
      {required this.branch, required this.placements, required this.barColor});
}

class PlacementCharts extends StatelessWidget {
  final List<PlacementData> data;

  PlacementCharts({required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<PlacementData, String>> series = [
      charts.Series(
        id: "developers",
        data: data,
        domainFn: (PlacementData series, _) => series.branch,
        measureFn: (PlacementData series, _) => series.placements,
        colorFn: (PlacementData series, _) => series.barColor,
        labelAccessorFn: (PlacementData series, _) => series.branch,
      )
    ];

    return Container(
      height: 600,
      padding: EdgeInsets.all(25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text('Placements for the batch : '),
                surfaceTintColor: Colors.yellowAccent,
              ),
              Expanded(
                child: charts.PieChart<String>(series,
                    animate: true,
                    defaultRenderer: charts.ArcRendererConfig(
                        arcRendererDecorators: [
                          charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ])),
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
