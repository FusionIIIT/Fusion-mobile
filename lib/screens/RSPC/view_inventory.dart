import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/screens/RSPC/financial_oulay.dart';

class View_Inventory extends StatefulWidget {
  const View_Inventory({Key? key}) : super(key: key);

  @override
  State<View_Inventory> createState() => _View_InventoryState();
}

class _View_InventoryState extends State<View_Inventory> {
  String _input = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Add your drawer item 1 functionality here
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Add your drawer item 2 functionality here
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/mypic.jpg',
                  width: 150.0,
                  height: 150.0,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Dr. Atul Gupta',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.orange[700],
                    border:
                        Border.all(color: Color.fromARGB(255, 179, 128, 51)),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'View Inventory',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              'Fill the Form',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 80,
              width: 300,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _input = value;
                  });
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter the Project name',
                  hintStyle: TextStyle(fontSize: 17),
                  contentPadding: EdgeInsets.all(80),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.black),
                    borderRadius: BorderRadius.circular(50.0), //<-- SEE HERE
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 130,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 10,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  outlay(index: _input)));
                    print(_input);
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)))),
            ),
          ),
        ],
      ),
    );
  }
}
