import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';

class PreviousYearWinnerPage extends StatelessWidget {
  final List<dynamic> displayData;
  const PreviousYearWinnerPage({super.key, required this.displayData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: DefaultAppBar().buildAppBar(),
          body: ListView.builder(
              itemCount: displayData.length,
              itemBuilder: (context, index) {
                final winner = displayData[index];
                return ListTile(
                  leading: Text('${winner['id']}'),
                  title: Text('${winner['student']}'),
                );
              })),
    );
  }
}
