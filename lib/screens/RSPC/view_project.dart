// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/services/service_locator.dart';
// import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/screens/RSPC/financial_oulay.dart';
import 'package:fusion/screens/RSPC/show_project.dart';
import 'package:fusion/screens/RSPC/view_staff.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
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
   var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");
  List<dynamic> projects = [];
  bool isLoading = false;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
      isError = false;
    });

    try {
      var storage_service = locator<StorageService>();
      if(storage_service.userInDB?.token == null)
      {
         throw Exception('Token Error');
      }
      Map<String,String> headers = {
        // 'Authorization' : 'Token'+(' c1c9f84430ef95a67e8a192962044dcf73a3677f')
        'Authorization' : 'Token '+(storage_service.userInDB?.token??"")
      };
      http.Response response = await http.get(
          Uri.http("172.27.16.214:8000","research_procedures/api/projects"),
          headers: headers,
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          projects = jsonData['projects'];
          isLoading = false;
        });
      } else {
        print(response.statusCode);
        print(storage_service.userInDB?.token??"");
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        curr_desig: curr_desig,
        headerTitle: "Research Module",
        onDesignationChanged: (newValue) {
          setState(() {
            curr_desig = newValue;
          });
        },
      ),
      drawer: SideDrawer(
        curr_desig: curr_desig,
      ),

      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : isError
              ? Center(
                  child: Text('Failed to load data. Please try again later.'),
                )
              : projects.isEmpty
                  ? Center(
                      child: Text('No projects available.'),
                    )
                  : ListView.builder(
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        final project = projects[index];
                        return GestureDetector(
  onTap: () {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Show_project(index: project['project_name']),
    ));
  },
  child: Container(
    color: Colors.grey[200],
    padding: EdgeInsets.all(10),
    child: Card(
      child: ListTile(
        title: Center(
          child: Text(
            'Project Name: ${project['project_name']}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('Sponsored Agency: ${project['sponsored_agency']}')),
            SizedBox(height: 10), // Add some space between subtitle and buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  outlay(index:project['project_id'])));
                  },
                  child: Text('Outlay'),
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 219, 190, 189)),
                ),
                SizedBox(width: 120), // Add some space between buttons
                ElevatedButton(
                  onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  View_staff(index: project['project_id'])));
                  },
                  child: Text('Staff'),
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 219, 190, 189)),
                ),
              ],
            ),
          ],
        ),
        // leading: Icon(
        //   Icons.book_online_rounded,
        //   size: 30,
        // ),
      ),
    ),
  ),
);

                        //   onTap: () {
                        //       Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) =>  Show_project(index: project['project_name'])));
                        //   },
                        //   child: Container(
                        //     color: Colors.grey[200],
                        //     padding: EdgeInsets.all(10),
                        //     child: Card(
                        //       child: ListTile(
                        //         title: Text(
                        //           'Project Name: ${project['project_name']}',
                        //           style: TextStyle(fontWeight: FontWeight.bold),
                        //         ),
                        //         subtitle: Text(
                        //             'Sponsored Agency: ${project['sponsored_agency']}'),
                        //         leading: Icon(
                        //           Icons.book_online_rounded,
                        //           size: 30,
                        //         ),
                               
                              
                                     
                                
                        //       ),
                              
                          
                              
                        //     ),
                        //   ),
                        // );
                      },
                    ),
    );
  }
}
