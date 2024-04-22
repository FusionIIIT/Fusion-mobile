import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/screens/Academic/Apply_for_Bonafide/pdf_services.dart';

import '../../../Components/bottom_navigation_bar.dart';
import '../../../services/service_locator.dart';
import '../../../services/storage_service.dart';

class Bonafide extends StatefulWidget {
  @override
  _BonafideState createState() => _BonafideState();
}

class _BonafideState extends State<Bonafide> {
  var service = locator<StorageService>();
late String curr_desig = service.getFromDisk("Current_designation");
  var details = {
    1: "Bonafide for Fee Structure",
    2: "Bonafide for Sim Card",
    3: "Bonafide for Passport",
    4: "Bonafide for Education loan",
    5: "Other purposes",
  };
  List<DropdownMenuItem<int>> _bonafideItems = [];
  void loadlist() {
    _bonafideItems = [];
    for (int i = 1; i <= details.length; i++) {
      _bonafideItems.add(DropdownMenuItem(
        child: Text(details[i]!),
        value: i,
      ));
    }
  }

  int _value = 1;
  String bonafidefor = "Bonafide for Fee Structure";
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    loadlist();
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Apply for Bonafide"),
          Text("Please select the purpose of bonafide:"),
          DropdownButton<int>(
            items: _bonafideItems,
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value!;
                bonafidefor = details[_value]!;
                print(bonafidefor);
              });
            },
            isExpanded: true,
          ),
          ElevatedButton(
            onPressed: () async {
              PdfService pdfService = new PdfService();
              final data = await pdfService.generatePdf(
                  bonafidefor == "Other purposes"
                      ? "_______"
                      : bonafidefor.substring(13),
                  arguments["firstName"] + " " + arguments["lastName"],
                  arguments["roll_no"],
                  arguments["branch"],
                  "B.TECH");
              pdfService.openFile(data);
            },
            child: Text("Submit"),
          ),
        ]),
      ),
    );
  }
}
