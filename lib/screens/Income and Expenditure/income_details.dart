import 'package:flutter/material.dart';
import 'package:fusion/screens/Income%20and%20Expenditure/income_homes/expense_history.dart';

import 'income_homes/add_expenditure_home.dart';
import 'income_homes/add_income_home.dart';
import 'income_homes/add_view_home.dart';
import 'income_homes/fixed_attributes.dart';


class IncomeDetailScreen extends StatefulWidget {
  const IncomeDetailScreen({Key? key}) : super(key: key);

  @override
  State<IncomeDetailScreen> createState() => _IncomeDetailScreenState();
}

class _IncomeDetailScreenState extends State<IncomeDetailScreen> {

  int selectedIndex=0;
  List<Widget>widgetList=[AddIncomeHome(),AddExpenditureHome(),FixedAttributeScreen(),AddViewHome(),ExpenseHistory()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Income info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_outlined),
            label: 'Expenditure',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_person),
            label: 'Fixed item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_comfortable_outlined),
            label: 'View stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Expense',
          ),
        ],
      ),
      body: widgetList[selectedIndex],
    );
  }
}
