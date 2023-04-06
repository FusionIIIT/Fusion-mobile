import 'package:flutter/material.dart';

import '../../../models/income_model.dart';
import '../utilities/custom_history_card.dart';

class ViewHistory extends StatelessWidget {
  ViewHistory({Key? key}) : super(key: key);

  List<IncomeModel> history=[
    IncomeModel(purpose: "p1", amount: 200, date: "12 dec 2022", remark: "nothing" ),
    IncomeModel(purpose: "p2", amount: 300, date: "13 dec 2022", remark: "nothing"),
    IncomeModel(purpose: "p3", amount: 400, date: "14 dec 2022", remark: "nothing"),
    IncomeModel(purpose: "p4", amount: 500, date: "15 dec 2022", remark: "nothing"),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:ListView.builder(
          shrinkWrap: true,
            itemCount: history.length,
            itemBuilder: (context,index){
            return CustomHistoryCard( incomeModel: history[index],);
        })
    );
  }
}
