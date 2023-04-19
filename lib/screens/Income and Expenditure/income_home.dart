import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Income%20and%20Expenditure/forms_tabs/view_screen_user.dart';

import '../../services/service_locator.dart';
import '../../services/storage_service.dart';
import 'forms_tabs/balance_sheet_screen.dart';

class IncomeHomeScreen extends StatefulWidget {
   IncomeHomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeHomeScreen> createState() => _IncomeHomeScreenState();
}

class _IncomeHomeScreenState extends State<IncomeHomeScreen> {

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
                    text: "View",
                  ),

                  // balance sheet
                  Tab(
                    text: "Balance sheet",
                  ),
                ]),

                Expanded(
                  child: TabBarView(
                    children: [
                      // view
                      ViewScreen(),

                      // balance sheet
                      BalanceSheetScreen(),
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
