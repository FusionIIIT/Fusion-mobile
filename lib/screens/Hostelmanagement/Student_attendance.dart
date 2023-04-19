import 'package:flutter/material.dart';
import 'package:fusion/main.dart';
import 'package:fusion/screens/Hostelmanagement/hostelmanagement.dart';

import 'Notice_Board.dart';

class Student_attendance extends StatelessWidget {
  //const SecondRoute({super.key});

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
        title: const Text('Student Attendance'),
        actions: const <Widget>[
          Icon(Icons.notifications),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            //child: Icon(Icons.search),
          ),
          // Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(children: <Widget>[
        Container(
          height: 200,
          width: 300,
          //color: Colors.purple,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(50),
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            color: Color(0xFFffffff),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 15.0,
                spreadRadius: 5.0,
                offset: Offset(5.0, 5.0),
              )
            ],
          ),

          child: Column(children: <Widget>[
            const Text(
              "Student attendance",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
              color: Colors.black,
            ),
             DropdownButton<String>(
                value: 'Select Hall',
                isExpanded: true,
                icon: const Icon(
                  Icons.home,
                  color: Colors.deepOrangeAccent,
                ),
                underline: const SizedBox(),
                onChanged: (String? newValue) {
                  if (newValue == 'Hall 1') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => attendance()),
                    );
                  } else if (newValue == 'Hall 3') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => attendance()),
                    );
                  } else if (newValue == 'Hall 4') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => attendance()),
                    );
                  } else if (newValue == 'Maa Saraswati') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => attendance()),
                    );
                  }
                  setState(() {
                    // handle updating category
                  });
                },
                items: <String>[
                  'Select Hall',
                  'Hall 1',
                  'Hall 3',
                  'Hall 4',
                  'Maa Saraswati'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
          ]),
        ),
      ]),
    );
  }
}
class attendance extends StatelessWidget {
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
      body: Column(children: <Widget>[
        Container(
          height: 500,
          width: 300,
          //color: Colors.purple,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(50),
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            color: Color(0xFFffffff),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 15.0,
                spreadRadius: 5.0,
                offset: Offset(5.0, 5.0),
              )
            ],
          ),
          child: Column(
            children: <Widget>[
              const Text(
                "Attendance",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Divider(
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Colors.black,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => view_attendance()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey, // Background color
                  alignment: Alignment.topLeft,
                ),
                icon: const Icon(
                  // <-- Icon
                  Icons.description,
                  size: 24.0,
                ),
                label: Text('Hall 4'),
                //<-- Text
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class view_attendance extends StatelessWidget {
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
            //child: Icon(Icons.search),
          ),
          //Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: <Widget>[
          const Text(
            "View Attendance",
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
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.grey, // Background color
              alignment: Alignment.topLeft,
            ),
            icon: const Icon(
              // <-- Icon
              Icons.description,
              size: 30.0,
            ),
            label: Text('Hall 4'),
            //<-- Text
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2.0),
                child: Text('Roll no',
                    style: TextStyle(color: Colors.black, fontSize: 30)),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'Name',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'Date',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'Present',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}