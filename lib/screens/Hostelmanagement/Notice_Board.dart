import 'package:flutter/material.dart';
import 'package:fusion/screens/Hostelmanagement/hostelmanagement.dart';
import 'package:fusion/main.dart';

void setState(Null Function() param0) {}

class Notice_Board extends StatelessWidget {
  get classname => null;
  List<String> items = ['Select Hall', 'Hall1', 'Hall2', 'Hall3'];
  String? selectedItem = 'Select Hall';

  //const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables

    var items;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: const Text('Notice Board'),
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

            child: Expanded(
              child: Column(
                children: <Widget>[
                  const Text(
                    "Notice Board",
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
                          MaterialPageRoute(builder: (context) => Notice()),
                        );
                      } else if (newValue == 'Hall 3') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Notice()),
                        );
                      }
                      else if (newValue == 'Hall 4') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Notice()),
                        );
                      }
                      else if (newValue == 'Maa Saraswati') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Notice()),
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
                ],
              ),
            ),
          )
        ]));
  }
}
class Notice extends StatelessWidget {
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
        title: const Text('Notice Board'),
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
                "Notice Board",
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
                      MaterialPageRoute(builder: (context) => noticeboard()));
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

class noticeboard extends StatelessWidget {
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
      body: Container(
        height: 550,
        width: 300,
        //color: Colors.purple,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(40),
        padding: const EdgeInsets.all(20),
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
              "Hall 4 Notice",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
            Text(
              'Tech Fest',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Aditya kumar",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 20),
            ),

            Center(
              child: Container(
                width: 400,
                height: 400,
                child: CustomPaint(
                  painter: OpenPainter(),
                ),
              ),
              //child: Text:,
            ),
          ],
        ),
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color.fromARGB(231, 245, 247, 246)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset(50, 100) & const Size(200, 150), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
