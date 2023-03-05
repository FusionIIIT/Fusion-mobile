import 'package:flutter/material.dart';
import 'package:fusion/screens/Income%20and%20Expenditure/forms_tabs/view_history.dart';

import '../../../Components/appBar.dart';
import '../../../Components/side_drawer.dart';
import '../forms_tabs/add_income.dart';

class AddIncomeHome extends StatefulWidget {
  const AddIncomeHome({Key? key}) : super(key: key);

  @override
  State<AddIncomeHome> createState() => _AddIncomeHomeState();
}

class _AddIncomeHomeState extends State<AddIncomeHome> {
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
                    text: "Add Income",
                  ),

                  // balance sheet
                  Tab(
                    text: "View History",
                  ),
                ]),

                Expanded(
                  child: TabBarView(
                    children: [
                      // view
                      AddIncomeScreen(),

                      // balance sheet
                      ViewHistory(),
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
