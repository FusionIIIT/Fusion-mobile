import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/Accounts%20and%20Finance/utilities/download_button.dart';
import 'package:fusion/services/finance_service.dart';

class ViewSalary extends StatefulWidget {
  const ViewSalary({Key? key}) : super(key: key);

  @override
  State<ViewSalary> createState() => _ViewSalaryState();
}

class _ViewSalaryState extends State<ViewSalary> {
  TextEditingController _monthController = TextEditingController();

  TextEditingController _yearController = TextEditingController();

  downloadSalary(String month, String year) async {
    try {
     var response=await FinanceService().getSalary(month, year);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // month
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Month",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  TextField(
                    controller: _monthController,
                    decoration: InputDecoration(
                      hintText: "Month",
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // year
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      "Year",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  TextField(
                    controller: _yearController,
                    decoration: InputDecoration(
                      hintText: "Year",
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: SizedBox(
                    height: 50,
                    width: 100,
                    child: DownloadButton(
                      onPress: () {
                        downloadSalary(_monthController.text,_yearController.text);
                      },
                      title: "download",
                      fileUrl:
                          "",
                      fileName: "random",
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
