import 'package:flutter/material.dart';

class engineer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40), // Adjusted for larger space
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180, // Adjusted for larger space
                height: 180, // Adjusted for larger space
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), // Adjusted for larger border radius
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                
                child: CircleAvatar(
                  radius: 60, // Adjusted for larger space
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(width: 30), // Adjusted for larger space
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manoj Kumar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24, // Adjusted for larger font size
                    ),
                  ),
                  Text(
                    'Software Engineer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20, // Adjusted for larger font size
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40), // Adjusted for larger space
          Container(
            padding: EdgeInsets.all(20), // Adjusted for larger padding
            color: Colors.orange,
            child: Text(
              'Complaints Inbox',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24, // Adjusted for larger font size
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20), // Adjusted for larger space
          // Here goes the section for complaints
          MailWidget(
            sender: 'John Doe',
            details: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          ),
          MailWidget(
            sender: 'Jane Smith',
            details: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          ),
          MailWidget(
            sender: 'Emma Johnson',
            details: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          ),
          // Add more MailWidget instances for additional complaints
          SizedBox(height: 20), // Adjusted for larger space
        ],
      ),
    );
  }
}

class MailWidget extends StatelessWidget {
  final String sender;
  final String details;

  const MailWidget({
    Key? key,
    required this.sender,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20), // Adjusted for larger padding
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjusted for larger margin
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // Adjusted for larger border radius
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'From: $sender',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20, // Adjusted for larger font size
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle forwarding complaints
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Forward',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18, // Adjusted for larger font size
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10), // Adjusted for larger space
          Text(
            details,
            style: TextStyle(
              fontSize: 18, // Adjusted for larger font size
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
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

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomNavBar(),
      ),
      body: engineer1(),
    ),
  ));
}