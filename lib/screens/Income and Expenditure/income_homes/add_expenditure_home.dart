import 'package:flutter/material.dart';
import 'package:fusion/screens/Income%20and%20Expenditure/forms_tabs/add_expenditure.dart';
import 'package:fusion/screens/Income%20and%20Expenditure/forms_tabs/expenditure_history.dart';

import '../../../Components/appBar.dart';
import '../../../Components/side_drawer.dart';
import '../forms_tabs/add_income.dart';
import '../forms_tabs/view_history.dart';

class AddExpenditureHome extends StatefulWidget {
  const AddExpenditureHome({Key? key}) : super(key: key);

  @override
  State<AddExpenditureHome> createState() => _AddExpenditureHomeState();
}

class _AddExpenditureHomeState extends State<AddExpenditureHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child:Scaffold(
          appBar: DefaultAppBar().buildAppBar(),
          drawer: SideDrawer(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TabBar(tabs: [
                  // view
                  Tab(
                    text: "Add Expenditure",
                  ),

                  // balance sheet
                  Tab(
                    text: "View History",
                  ),
                ]),

                Expanded(
                  child: TabBarView(
                    children: [
                      // add expenditure
                      AddExpenditure(),

                      // view history
                      ExpenditureHistory(),
                      // BalanceSheetScreen(),
                    ],
                  ),
                ),


              ],
            ),
          ),
        )
    );
  }
}
