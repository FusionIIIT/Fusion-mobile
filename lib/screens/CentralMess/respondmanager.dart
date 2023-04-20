import 'package:flutter/material.dart';
import '../../Components/messtable.dart';
import '../../Components/side_drawer.dart';
import '../../constants.dart';


class RespondRequests extends StatelessWidget {
  const RespondRequests({Key? key}) : super(key: key);

  final List<List<String>> head1 = const [['Date', 'Student', 'From', 'To', 'Approve/Reject']];
  final List<List<String>> head2 = const [['Date', 'Student', 'Purpose', 'From', 'To', 'Approve/Reject']];
  final List<List<String>> rebate = const [['January 2023','20bcs018','20/03/2023','25/03/2023'],];
  final List<List<String>> food = const [['January 2023','20bcs018', 'Sick', '20/03/2023','25/03/2023'],];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Respond to Rebate',
              ),
              Tab(
                text: 'Respond to Food Requests',
              ),
            ],
          ),
        ),
        drawer: SideDrawer(),
        body: TabBarView(
          children: <Widget>[
            MessTable(head: head1,body: rebate,child:
            Column(
              children: [
                RespondButton(val: 'Accept', color: Colors.green, onclick: () {  },),
                RespondButton(val: 'Reject', color: Colors.red, onclick: () {  },),
              ],
            ),),
            MessTable(head: head2, body: food, child:
            Column(
              children: [
                RespondButton(val: 'Accept', color: Colors.green, onclick: () {  },),
                RespondButton(val: 'Reject', color: Colors.red, onclick: () {  },),
              ],
            ),)
          ],
        ),
      ),
    );
  }
}