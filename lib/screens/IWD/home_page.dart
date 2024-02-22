import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';


class IWDHomePage extends StatefulWidget {
  @override
  _IWDHomePage createState() => _IWDHomePage();
}

class _IWDHomePage extends State<IWDHomePage> {

  void initState() {
    super.initState();
  }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileWidget(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OrangeButton(text: 'Create New\nRequest', href:"/iwd/process_request", ogContext: context,),
                    OrangeButton(text: 'Issue Work\nOrder', href:"",  ogContext: context,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OrangeButton(text: 'Process\nBill', href:"/iwd/forward_bills",  ogContext: context,),
                    OrangeButton(text: 'Generate Final\nBill', href:"/iwd/forward_bills", ogContext: context,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OrangeButton(
                        text: 'Forwarded\nComplaints', notificationCount: 12, href:"/iwd/complaint_inbox", ogContext: context,),
                    OrangeButton(text: 'Process\nRequest', href:"/iwd/process_request", ogContext: context,),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    ),
  ));
  }
}


class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Manoj Kumar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Software Engineer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class CustomNavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepOrange, // Changed color to deep orange
      title: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle menu button press
            },
          ),
          Text(
            'Fusion',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            // Handle search button press
          },
        ),
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {
            // Handle notification button press
          },
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: () {
            // Handle dropdown menu button press
          },
        ),
      ],
    );
  }
}

class OrangeButton extends StatelessWidget {
  final String text;
  final String href;
  final int notificationCount;
  final BuildContext ogContext;

  const OrangeButton({
    Key? key,
    required this.text,
    required this.href,
    this.notificationCount = 0,
    required this.ogContext, // Default notification count is 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          height: 50,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(ogContext, href);
              
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              
            ),
          
          ),
        
        ),
        if (notificationCount > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$notificationCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomNavBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileWidget(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // OrangeButton(text: 'Create New\nRequest',href:"/iwd/process_request",ogContext: context,),
                    // OrangeButton(text: 'Issue Work\nOrder', href:""),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // OrangeButton(text: 'Process\nBill', href:""),
                    // OrangeButton(text: 'Generate Final\nBill', href:""),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // OrangeButton(
                    //     text: 'Forwarded\nComplaints', notificationCount: 12, href:""),
                    // OrangeButton(text: 'Process\nRequest', href:""),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    ),
  ));
}
