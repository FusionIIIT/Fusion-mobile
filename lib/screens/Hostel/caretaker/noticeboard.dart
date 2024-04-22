import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fusion/Components/side_drawer.dart';

class Noticeboard extends StatefulWidget {
  const Noticeboard({Key? key}) : super(key: key);

  @override
  _NoticeboardState createState() => _NoticeboardState();
}

class _NoticeboardState extends State<Noticeboard> {
  List<String> notices = []; // Define the 'notices' list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('Notice Board'),
        backgroundColor:
        const Color.fromARGB(255, 245, 103, 47), // Add 'const' keyword
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: notices.length,
            itemBuilder: (context, index) {
              return Card(
                color: Color.fromARGB(255, 255, 229, 218), // Set the card background color to faint orange
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0), // Add border radius of 5px
                  side: BorderSide(
                    color: Color.fromARGB(255, 245, 103, 47),
                    width: 2.0,
                  ),
                ),
                child: ListTile(
                  title: Text(notices[index]),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new notice logic here
          setState(() {
            notices.add(
                'Sample Notice'); // Add a sample notice to the 'notices' list
          });
        },
        child: const Icon(Icons.add), // Add 'const' keyword
        backgroundColor: Color.fromARGB(255, 245, 103, 47), // Set the background color to orange
        foregroundColor: Colors.white, // Set the foreground color to white
      ),
    );
  }
}
