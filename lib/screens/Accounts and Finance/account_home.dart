import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Accounts%20and%20Finance/view_salary.dart';

import 'bank_detail.dart';
import 'department.dart';

class AccountHome extends StatefulWidget {
  const AccountHome({Key? key}) : super(key: key);

  @override
  State<AccountHome> createState() => _AccountHomeState();
}

class _AccountHomeState extends State<AccountHome> {

  int selectedInd=0;
  final pages=[DepartMent(),BankDetail(),ViewSalary()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedInd,
        onTap: (index){
          setState(() {
            selectedInd=index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Department"),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on),label: "Bank"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt),label: "View Salary"),
        ],
      ),
      body:pages[selectedInd]
    );
   }
}



