import 'package:flutter/material.dart';
import 'package:fusion/screens/Income%20and%20Expenditure/utilities/sheet_card.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  DateTime _selectedYear = DateTime.now();
  List<String> dates=["Select financial year","Select financial year","Select financial year"];

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
                    ElevatedButton(
                        onPressed: () => null, child: Text("Get stats"))
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
                    ElevatedButton(
                        onPressed: () => null, child: Text("Get stats"))
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
                    ElevatedButton(
                        onPressed: () => null, child: Text("Get stats"))
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
