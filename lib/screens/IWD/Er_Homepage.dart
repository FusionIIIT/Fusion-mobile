import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/IWD/Create_Request.dart';
import 'package:fusion/screens/IWD/Created_Requests.dart';
import 'package:fusion/screens/IWD/Generated_Bill_Req.dart';
import 'package:fusion/screens/IWD/Issue_Work_Order.dart';
import 'package:fusion/screens/IWD/Rejected_Requests.dart';
import 'package:fusion/screens/IWD/Request_In_Progress.dart';
import 'package:fusion/screens/IWD/Request_Status.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.deepOrange, // Set primary color to deep orange
//       ),
//       routes: {
//         '/': (context) => MyHomePage(),
//         '/create_request': (context) => RequestPage(title: 'Create Request'),
//         '/created_requests': (context) =>
//             RequestPage(title: 'Created Requests'),
//         '/rejected_requests': (context) =>
//             RequestPage(title: 'Rejected Requests'),
//         '/issue_work_order': (context) =>
//             RequestPage(title: 'Issue Work Order'),
//         '/requests_in_progress': (context) =>
//             RequestPage(title: 'Requests in Progress'),
//         '/generate_bills': (context) => RequestPage(title: 'Generate Bills'),
//         '/requests_status': (context) => RequestPage(title: 'Requests Status'),
//       },
//       initialRoute: '/',
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // const MyHomePage({Key? key}) : super(key: key);
  
  // var service = locator<StorageService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: const Text('IWD Department'),
        backgroundColor: Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
              ),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RequestsUI()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 245, 103, 47),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Create Request',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreatedRequestsWidget()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 245, 103, 47),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Created Requests',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GeneratedBillsRequestsWidget()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 245, 103, 47),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Generated Bills',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          'Requests',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IssueWorkWidget()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 245, 103, 47),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Issue Work',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          'Order',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RequestsScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 245, 103, 47),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Rejected Requests',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RequestsInProgressScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 245, 103, 47),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Requests in',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          'Progress',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RequestStatus()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 245, 103, 47),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Request',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          'Status',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

// class CustomButton extends StatelessWidget {
//   final String title;
//   final String route;

//   const CustomButton({
//     Key? key,
//     required this.title,
//     required this.route,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       width: 200,
//       height: 50,
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.pushNamed(context, route);
//         },
//         child: Text(
//           title,
//           style: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
// }

// class RequestPage extends StatelessWidget {
//   final String title;

//   const RequestPage({
//     Key? key,
//     required this.title,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Text(
//           title,
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
