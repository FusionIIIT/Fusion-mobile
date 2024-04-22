import 'package:flutter/material.dart';
import 'package:fusion/screens/AwardsandScholarships/SpacsConvener/browse_applications.dart';
import 'package:fusion/screens/AwardsandScholarships/SpacsConvener/browse_award_catalogue.dart';
import 'package:fusion/screens/AwardsandScholarships/SpacsConvener/invite_applications.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';
class ConvenerHomePage extends StatefulWidget {
  const ConvenerHomePage({super.key});

  @override
  State<ConvenerHomePage> createState() => _ConvenerHomePageState();
}

class _ConvenerHomePageState extends State<ConvenerHomePage> {
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
                    'Spacs Convener', // Display Type of User
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),

           
            Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                // Container(
                //   height: 30, width: 130,
                // ),
                SizedBox( width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return BrowseAwardCatalogue();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent,
                        
                      ),
                      child: Text('Manage Catalogue')),
                ),
                      SizedBox(width: 250,
                        child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return InviteApplications();
                                          }));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.deepOrangeAccent,
                                        ),
                                        child: Text('Invite Applications'),
                                      ),
                      ),
                  SizedBox(width: 250,
                    child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return BrowseApplications();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    child: Text('Browse  Applications'),
                                  ),
                  ),
               
              
              ],
            ),
        
          ],
        
    );
  }
}