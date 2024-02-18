import 'package:flutter/material.dart';
import 'package:fusion/constants.dart';
import 'package:intl/intl.dart';

class MessMonthlyBill extends StatefulWidget {
  @override
  _MessMonthlyBillState createState() => _MessMonthlyBillState();
}

class _MessMonthlyBillState extends State<MessMonthlyBill> {
  bool _loading = true;
  int remBalance = 0;
  int monthlyBill = 3150, specialReqBill = 0, rebateAmount = 0;
  int totalBill = 0;
  // int totalBill = 0 (monthlyBill + specialReqBill - rebateAmount);

  // @override
  // void initState() {
    // super.initState();
    // _dashboardController = StreamController();
    // dashboardService = DashboardService();
    // _profileController = StreamController();
    // profileService = ProfileService();
    // getData();
  // }

  // getData() async {
  //   try {
  //     Response response = await dashboardService.getDashboard();
  //     Response response2 = await profileService.getProfile();
  //     setState(() {
  //       data = DashboardData.fromJson(jsonDecode(response.body));
  //       data2 = ProfileData.fromJson(jsonDecode(response2.body));
  //       _loading = false;
  //     });
  //     name = data2.user!['first_name'] + ' ' + data2.user!['last_name'];
  //     studentType = data2.profile!['department']!['name'] +
  //         '  ' +
  //         data2.profile!['user_type'];
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // loadData() async {
  //   getData().then((res) {
  //     _dashboardController.add(res);
  //     _profileController.add(res);
  //   });
  // }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.deepOrangeAccent, width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentMonth = DateFormat('MMMM').format(now);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Remaining Balance: + $remBalance Rs",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 2.0,
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(
        //      "Monthly Bill for month: $currentMonth",
        //     style: TextStyle(fontSize: 15.0, color: Colors.orange, ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Month: ",
                  style: TextStyle(fontSize: 18.0, color: kPrimaryColor),
                ),
                TextSpan(
                  text: currentMonth,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold, // Make it bold
                  ),
                ),
              ],
            ),
          ),
        ),
        DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Description',
              ),
            ),
            DataColumn(
              label: Text(
                'Amount',
              ),
            ),
          ],
          rows:  <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Monthly Bill:')),
                DataCell(Text('$monthlyBill Rs')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Special Request Bill:')),
                DataCell(Text('$specialReqBill Rs')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Rebate Amount:')),
                DataCell(Text('$rebateAmount Rs')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Total Bill:', style: TextStyle(fontWeight: FontWeight.w800),)),
                DataCell(Text('$totalBill Rs')),
              ],
            ),
          ],
        ),
      ],
    );
  }
}