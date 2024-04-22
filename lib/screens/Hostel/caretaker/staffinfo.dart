import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fusion/Components/side_drawer.dart';

class Staffinfo extends StatelessWidget {
  const Staffinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  SideDrawer(),
      appBar: AppBar(
        title: const Text('Staff Info'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 50),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                for (int i = 1; i < 15; i++)
                  Card(
                    color: Color.fromARGB(255, 245, 103, 47),
                    child: ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Staff $i',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new staff info logic here
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 255, 152, 111),
        foregroundColor: Color(0xffffffff),
      ),
    );
  }
}
