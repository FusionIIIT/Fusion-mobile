import 'package:flutter/material.dart';
import 'package:fusion/screens/Accounts%20and%20Finance/utilities/download_button.dart';
import 'package:fusion/services/income_service.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../../models/complaints.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  DateTime _selectedYear = DateTime.now();
  List<String> dates=["Select financial year","Select financial year","Select financial year"];


  getIncomeDetails(String date)async{
    try {
      var response = await IncomeServices().getIncomeStats(date);
      setState(() {
        //todo  set data from response
      });
    } catch (e) {
      print(e);
    }
  }

  getExpenditureDetails(String date)async{
    try{
      var response = await IncomeServices().getExpenditureStats(date);
      setState(() {
        //todo  set data from response
      });
    }catch(e) {
      print(e);
    }
  }

  getComparisonStats(String date)async{
    try{
      var response = await IncomeServices().getComparison(date);
      setState(() {
        //todo  set data from response
      });
    }catch(e) {
      print(e);
    }
  }


   _pickYear(context,int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Select Year"),
              content: SizedBox(
                width: 300,
                height: 300,
                child: YearPicker(
                  firstDate: DateTime(DateTime.now().year - 20, 1),
                  lastDate: DateTime(DateTime.now().year),
                  initialDate: DateTime(DateTime.now().year),
                  selectedDate: _selectedYear,
                  onChanged: (DateTime value) {
                    setState(() {
                      _selectedYear = value;
                      dates[index]=value.year.toString();
                    });
                    Navigator.pop(context);
                  },
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Column(
          children: [
            // view stats
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "View Income stats",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                         _pickYear(context,0);
                      },
                      child: Row(
                        children: [
                          Text(dates[0], style: TextStyle()),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    DownloadButton(onPress:dates[0]!="Select financial year"?getIncomeDetails(dates[0]):(){},  fileUrl: "fileUrl", fileName: "fileName", title: "Get stats")
                  ],
                )
              ],
            ),

            // view expenditure
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "View Expenditure stats",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        _pickYear(context,1);
                      },
                      child: Row(
                        children: [
                          Text(dates[1], style: TextStyle()),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                   DownloadButton(onPress:dates[1]!="Select financial year"?getExpenditureDetails(dates[1]):(){},  fileUrl: "fileUrl", fileName: "fileName", title: "Get stats")
                  ],
                )
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Compare Income And Expenditure",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        _pickYear(context,2);
                      },
                      child: Row(
                        children: [
                          Text(dates[2], style: TextStyle()),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    DownloadButton(onPress:dates[2]!="Select financial year"?getComparisonStats(dates[2]):(){},  fileUrl: "fileUrl", fileName: "fileName", title: "Get stats")
                  ],
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
