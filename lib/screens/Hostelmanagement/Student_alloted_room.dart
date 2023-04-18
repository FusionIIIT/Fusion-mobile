import 'package:flutter/material.dart';
import 'package:fusion/main.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:fusion/screens/Hostelmanagement/hostelmanagement.dart';

import 'Notice_Board.dart';

class Student_alloted_room extends StatelessWidget {
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
        title: const Text("Student's Alloted Room"),
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
      body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 182,
            height: 146,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0x0a000000),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.only(
              top: 23,
              bottom: 83,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 140,
                  height: 40,
                  child: Material(
                    color: Color(0xffd9d9d9),
                    borderRadius: BorderRadius.circular(5),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 50,
                          top: 10,
                          child: Text(
                            "Select Hall",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: 39,
                              height: 40,
                              child: Material(
                                color: Color(0xff808080),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                width: 18,
                                height: 18,
                                child: IconButton(
                                    icon: Icon(Icons.home),
                                    onPressed: () {
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
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Alloted_room()),
                                            );
                                          } else if (newValue == 'Hall 3') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Alloted_room()),
                                            );
                                          } else if (newValue == 'Hall 4') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Alloted_room()),
                                            );
                                          } else if (newValue ==
                                              'Maa Saraswati') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Alloted_room()),
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
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      );
                                    })),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
          /*  Column(
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
      ),   */
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
