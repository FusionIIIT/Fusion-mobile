import 'package:flutter/material.dart';
import '../../Components/messtable.dart';
import '../../Components/side_drawer.dart';
import '../../constants.dart';


class ResMenuChange extends StatelessWidget {
  const ResMenuChange({Key? key}) : super(key: key);

  final List<List<String>> head1 = const [['Date', 'Student', 'Current dish', 'Requested Dish', 'Reason', 'Approve/Reject']];
  final List<List<String>> dish = const [['January 2023','20bcs018', 'Daal rice', 'Biryani','Repeated'],];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      drawer: SideDrawer(),
      body: Column(
        children: <Widget>[
          MessTable(head: head1,body: dish,child:
          Column(
            children: [
              RespondButton(val: 'Accept', color: Colors.green, onclick: () {  },),
              RespondButton(val: 'Reject', color: Colors.red, onclick: () {  },),
            ],
          ),),
        ],
      ),
    );
  }
}
