import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/screens/Income%20and%20Expenditure/utilities/expense_history_card.dart';

import '../../../Components/side_drawer.dart';
class ExpenseHistory extends StatefulWidget {
  const ExpenseHistory({Key? key}) : super(key: key);

  @override
  State<ExpenseHistory> createState() => _ExpenseHistoryState();
}

class _ExpenseHistoryState extends State<ExpenseHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context,index){
        return ExpenseHistroyCard();
      }),
      ),
    );
  }
}
