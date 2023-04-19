import 'package:flutter/material.dart';

import '../../../Components/appBar.dart';
import '../../../Components/side_drawer.dart';
import '../forms_tabs/add_income.dart';
import '../forms_tabs/balance_sheet_screen.dart';
import '../forms_tabs/view_history.dart';
import '../forms_tabs/view_screen_user.dart';

class AddViewHome extends StatefulWidget {
  const AddViewHome({Key? key}) : super(key: key);

  @override
  State<AddViewHome> createState() => _AddViewHomeState();
}

class _AddViewHomeState extends State<AddViewHome> {
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
                      ViewScreen(),

                      // balance sheet
                      BalanceSheetScreen(),
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
