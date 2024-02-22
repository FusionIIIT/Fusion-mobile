import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';


class ProcessRequest extends StatefulWidget {
  @override
  _ProcessRequest createState() => _ProcessRequest();
}

class _ProcessRequest extends State<ProcessRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: MaterialApp(
    home: Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(kToolbarHeight),
      //   child: CustomNavBar(),
      // ),
      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manoj Kumar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Software Engineer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.orange,
            child: Text(
              'Process Request',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          // New Section
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
            child: Column(
              children: [
                Text(
                  'Upload Request as PDF',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle upload button press
                    Navigator.pushNamed(context, "/iwd/process_request_2");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Upload',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ))));
  }
}
