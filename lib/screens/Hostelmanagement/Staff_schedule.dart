import 'package:flutter/material.dart';
import 'package:fusion/main.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:fusion/screens/Hostelmanagement/hostelmanagement.dart';



class Staff_schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text('FUSION'),
        actions: const <Widget>[
          Icon(Icons.notifications),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: <Widget>[
          const Text(
            "Schedule of Staff",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          // const Divider(
          //   height: 20,
          //   thickness: 2,
          //   indent: 20,
          //   endIndent: 0,
          //   color: Colors.black,
          // ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Staff_schedule()));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.grey, // Background color
              alignment: Alignment.topLeft,
            ),
            icon: const Icon(
              // <-- Icon
              Icons.description,
              size: 30.0,
            ),
            label: Text('Select Hall'),
            //<-- Text
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2.0),
                child: Text('Name',
                    style: TextStyle(color: Colors.black, fontSize: 25)),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'Date',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'Starting Time',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'Ending Time',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              Divider(
                height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 0,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
