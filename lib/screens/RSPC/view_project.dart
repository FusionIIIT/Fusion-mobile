// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/RSPC/financial_oulay.dart';
import 'package:http/http.dart' as http;

// class View_project extends StatelessWidget {
//   const View_project({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DefaultAppBar().buildAppBar(),
//       drawer: SideDrawer(),
//       body: ListView(children: <Widget>[
//         SizedBox(
//           height: 20,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             children: [
//               Image.asset(
//                 'assets/mypic.jpg',
//                 width: 150.0,
//                 height: 150.0,
//               ),
//               SizedBox(
//                 width: 30,
//               ),
//               Text(
//                 "Dr. Atul gupta ",
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 60,
//               width: 350,
//               decoration: BoxDecoration(
//                   color: Colors.orange[700],
//                   border: Border.all(color: Color.fromARGB(255, 179, 128, 51)),
//                   borderRadius: BorderRadius.circular(5)),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'View Staff info',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 15.0),
//           child: Text(
//             'Enter the Project ID :',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//         ),
//         SizedBox(
//           height: 3,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: SizedBox(
//             width: 100,
//             child: TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 // hintText: 'Enter no of staff you want in your project',
//               ),
//               maxLines: 1,
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(40.0),
//           child: SizedBox(
//             width: 30,
//             child: ElevatedButton(
//               onPressed: () {},
//               child: Text(
//                 'Submit',
//                 style: TextStyle(color: Colors.white),
//               ),
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromARGB(255, 81, 152, 210)),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }
class View_project extends StatefulWidget {
  const View_project({Key? key}) : super(key: key);

  @override
  State<View_project> createState() => _View_projectState();
}

class _View_projectState extends State<View_project> {
  List<dynamic> userData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Make the HTTP request
    final String response = await rootBundle.loadString('assets/db.json');

    Map<String, dynamic> data = json.decode(response);

    print("ho gaya fetch");
    List<dynamic> user = data['user'];

    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: ListView.builder(
        itemCount: userData.length,
        itemBuilder: (context, index) {
          var user = userData[index];
          return GestureDetector(
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  outlay(index: userData[index]['Project Name'])));
              print('Tapped on item $index');
              print(userData[index]['Project Name']);

            },
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(10),
              child: Card(
                child: ListTile(
                  title: Text(
                    'Project Name: ${user['Project Name']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle:
                      Text('Sponsored Agency: ${user['Sponsored Agency']}'),
                  leading: Icon(
                    Icons.book_online_rounded,
                    size: 30,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
