import 'package:flutter/material.dart';
import 'package:fusion/Components/messtable.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/constants.dart';

class FeedbackStats extends StatefulWidget {
  const FeedbackStats({Key? key}) : super(key: key);

  @override
  State<FeedbackStats> createState() => _FeedbackStatsState();
}

class _FeedbackStatsState extends State<FeedbackStats> {

   List<List<String>> head =  [['Date', 'Student ID', 'Description', 'Mess']];
   List<List<String>> food =  [['10 april 2023', '20bcs018', 'not edible', 'Mess 2']];
   List<List<String>> maintenance =[[]];
   List<List<String>> cleanliness = [[]];
   List<List<String>> other = [['10 april 2023', '20bcs018', 'not edible', 'Mess 2']];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Food',
              ),
              Tab(
                text: 'Cleanliness',
              ),
              Tab(
                text: 'Maintenance',
              ),
              Tab(
                text: 'Other',
              ),
            ],
          ),
        ),
        drawer: SideDrawer(),
        body: TabBarView(
          children: [
            MessTable(head: head, body: food),
            MessTable(head: head, body: cleanliness),
            MessTable(head: head, body: maintenance),
            MessTable(head: head, body: other),
          ],
        ),
      ),
    );
  }
}
