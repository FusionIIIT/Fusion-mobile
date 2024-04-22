import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';

import '../../../Components/bottom_navigation_bar.dart';
import '../../../services/service_locator.dart';
import '../../../services/storage_service.dart';

class BranchChange extends StatefulWidget {
  @override
  _BranchChangeState createState() => _BranchChangeState();
}

class _BranchChangeState extends State<BranchChange> {
  var service = locator<StorageService>();
late String curr_desig = service.getFromDisk("Current_designation");
  final List departmentsList = [
    "department: Finance and Accounts",
    "department: Establishment",
    "department: Academics",
    "department: Computer Center",
    "department:ECE",
    "department:Natural Science",
    "department:Mechatronics",
    "department:Placement Cell",
    "department:IWD",
    "department:Office of the Dean R&D",
    "department:Directorate",
    "department:ME",
    "department:Library",
    "department:Office of the Dean P&D",
    "department:Student Affairs",
    "department:General Administration",
    "department:Registrar Office",
    "department:Purchase and Store",
    "department:Design",
    "department:Workshop",
    "department:Establishment & P&S",
    "department:F&A & GA",
    "department:Establishment RTI and Rajbhasha",
    "department:Security and Central Mess",
    "department:CSE",
  ];
  List<ListItem> departments = [];
  List<DropdownMenuItem<int>> departmentsItems = [];
  int selectedDepartment = 0;

  void loadDepartmentsList() {
    departments = [];
    departmentsItems = [];
    for (int i = 0; i < departmentsList.length; i++) {
      departments.add(ListItem(i, departmentsList[i]));
    }
    for (ListItem listItem in departments) {
      departmentsItems.add(DropdownMenuItem(
        child: Text(listItem.name),
        value: listItem.value,
      ));
    }
  }

  String department = "";
  @override
  Widget build(BuildContext context) {
    loadDepartmentsList();
    return Scaffold(
      appBar: CustomAppBar(curr_desig: curr_desig,
        headerTitle: 'Branches', // Set your app bar title
        onDesignationChanged: (newValue) {
          // Handle designation change if needed
        },),
      drawer: SideDrawer(curr_desig: curr_desig),
      bottomNavigationBar:
      MyBottomNavigationBar(),
      body: Container(
          child: Column(
        children: [
          Text("Branches:"),
          DropdownButton<int>(
            items: departmentsItems,
            onChanged: (value) {
              setState(() {
                department = departments[value!].name;
                selectedDepartment = value;
              });
            },
            hint: Text("--------"),
            value: selectedDepartment,
          ),
          ElevatedButton(
            child: Text("Submit"),
            onPressed: () {},
          )
        ],
      )),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
