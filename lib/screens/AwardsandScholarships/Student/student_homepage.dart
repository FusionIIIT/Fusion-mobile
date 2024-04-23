import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/applyforawards.dart';
import 'package:fusion/screens/AwardsandScholarships/Student/browseawardcatalogue.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  String? name;
  String? depttype;
  String? type;
  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    name = service.profileData.user!["first_name"] +
        " " +
        service.profileData.user!["last_name"];
    depttype = service.profileData.profile!['department']!['name'] +
        " " +
        service.profileData.profile!['user_type'];

    type = service.profileData.profile!['user_type'];
  }

  Widget build(BuildContext context) {
    return  Column(
          children: [
            Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 90.0, vertical: 30.0),
              shadowColor: Colors.black,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    width: 190.0,
                    height: 170.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/profile_pic.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    name!, //Display name of User
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    depttype!, // Display Type of User
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(type!),
                ],
              ),
            ),
            
          
            Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 80.0, vertical: 30.0),
              shadowColor: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                      ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ApplyForAwards();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent,
                      ),
                      child: Row(
                        children: [
                          Text('Apply For Awards'),Spacer(),Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return BrowseAwardCatalogue();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Browse Award Catalogue'),
                            Icon(Icons.arrow_forward),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      width: 250.0,
                      height: 10.0,
                    ),
                    Text(
                      "Catalogue", //Display name of User
                      style: TextStyle(fontSize: 13.0, color: Colors.black),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Previous Winners", // Display Type of User
                      style: TextStyle(fontSize: 13.0, color: Colors.black),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "SPACS Members", // Display Type of User
                      style: TextStyle(fontSize: 13.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            // Card(
            //   elevation: 2.0,
            //   margin: EdgeInsets.symmetric(horizontal: 90.0, vertical: 30.0),
            //   shadowColor: Colors.black,
            //   child: Column(
            //     children: [
            //       SizedBox(
            //         height: 30.0,
            //       ),
                
            //       Container(
            //         margin: EdgeInsets.only(top: 20.0),
            //         width: 250.0,
            //         height: 10.0,
            //       ),
            //     ],
            //   ),
            // ),
          ],
      
    );
  }
}
