import 'package:flutter/material.dart';
import 'package:fusion/Components/CustomElevatedButton.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/CentralMess/menuchangestatus.dart';
import '../../constants.dart';

class ReqMenuChange extends StatefulWidget {
  const ReqMenuChange({Key? key}) : super(key: key);

  @override
  State<ReqMenuChange> createState() => _ReqMenuChangeState();
}

class _ReqMenuChangeState extends State<ReqMenuChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Dish :',style: TextStyle(fontSize: 17),),
            SizedBox(
              height: 10,
            ),
            DropdownButtonExample(),
            SizedBox(
              height: 20,
            ),
            Text('Request Dish :',
            style: TextStyle(fontSize: 17),),
            MyTextField(),
            SizedBox(
              height: 20,
            ),
            Text('Reason :',style: TextStyle(fontSize: 17),),
            MyTextField(),
            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Expanded(child: CustomElevatedButton(onPressed: (){}, text: 'Request', isFilled: true)),
                SizedBox(width: 10,),
                Expanded(child: CustomElevatedButton(onPressed: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuChangeStatus()),
                );}, text: 'Status', isFilled: true)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(8),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

const List<String> list = ['Cleanliness', 'Food', 'Maintenance', 'Others'];

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_downward,
        color: Colors.deepOrangeAccent,
      ),
      elevation: 16,
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}