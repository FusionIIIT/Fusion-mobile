import 'package:flutter/material.dart';
class BalanceSheetScreen extends StatefulWidget {
  const BalanceSheetScreen({Key? key}) : super(key: key);

  @override
  State<BalanceSheetScreen> createState() => _BalanceSheetScreenState();
}

class _BalanceSheetScreenState extends State<BalanceSheetScreen> {

  DateTime _selectedYear = DateTime.now();
  List<String> dates=["Select financial year"];

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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child:   // view stats
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Balance sheet",
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
                    onPressed: () => null, child: Text("Submit"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
