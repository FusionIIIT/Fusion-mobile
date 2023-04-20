import 'package:flutter/material.dart';
import 'package:fusion/main.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:fusion/screens/HostelManagement/hostelmanagement.dart';

import 'Notice_Board.dart';

class Student_alloted_room extends StatelessWidget {
  //const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text("Student's Alloted Room",
            style: TextStyle(color: Colors.white)),
        actions: const <Widget>[
          Icon(Icons.notifications, color: Colors.white),
        ],
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: <Widget>[
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
              // IconButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => Alloted_room()),
              //     );
              //   },
              //   icon: Icon(
              //     Icons.edit,
              //   ),
              // ),
              const Text(
                "Edit student",
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
                      MaterialPageRoute(builder: (context) => Alloted_room()),
                    );
                  } else if (newValue == 'Hall 3') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Alloted_room()),
                    );
                  } else if (newValue == 'Hall 4') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Alloted_room()),
                    );
                  } else if (newValue == 'Maa Saraswati') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Alloted_room()),
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
        ],
      ),
    );
  }
}

class Alloted_room extends StatelessWidget {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text("Student's Alloted Room",
            style: TextStyle(color: Colors.white)),
        actions: const <Widget>[
          Icon(Icons.notifications, color: Colors.white),
        ],
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Alloted_room()),
              );
            },
            child: Column(
              children: [
                Icon(Icons.edit),
                SizedBox(width: 8),
                Text(
                  "Edit student",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          //       Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // children: <Widget>[
          //   IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Alloted_room()),
          //       );
          //     },
          //     icon: Icon(Icons.edit),

          //const SizedBox(width: 8),
          // const Text(
          //   "Edit student",
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          // ),
          //),

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
                  "Alloted room",
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => rooms()));
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
        ],
      ),
    );
  }
}

class rooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text("Student's Alloted Room",
            style: TextStyle(color: Colors.white)),
        actions: const <Widget>[
          Icon(Icons.notifications, color: Colors.white),
        ],
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: <Widget>[
          const Text(
            "Alloted room",
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
                  context, MaterialPageRoute(builder: (context) => rooms()));
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
            label: Text('Hall 4'),
            //<-- Text
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2.0),
                child: Text('Roll no',
                    style: TextStyle(color: Colors.black, fontSize: 25)),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'Name',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'Programme',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'Room no',
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
