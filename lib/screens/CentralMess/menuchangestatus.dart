import 'package:flutter/material.dart';
import '../../Components/messtable.dart';
import '../../Components/side_drawer.dart';
import '../../constants.dart';


class MenuChangeStatus extends StatelessWidget {
  const MenuChangeStatus({Key? key}) : super(key: key);

  final List<List<String>> head1 = const [['Date', 'Student', 'Current dish', 'Requested Dish', 'Reason', 'Status']];
  final List<List<String>> dish = const [['January 2023','20bcs018', 'Daal rice', 'Biryani','Repeated', 'Approved'],];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      drawer: SideDrawer(),
      body: Column(
        children: <Widget>[
          MessTable(head: head1,body: dish),
        ],
      ),
    );
  }
}
