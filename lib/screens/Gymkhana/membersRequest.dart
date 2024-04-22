// import 'package:flutter/material.dart';
// import 'package:fusion/services/viewmembersrecord.dart'; // Import the backend file

// class MemberRequestPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Members Request',
//           style: TextStyle(color: Colors.deepOrangeAccent),
//         ),
//         backgroundColor: Colors.black,
//         iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
//       ),
//       body: MemberRequestList(),
//     );
//   }
// }

// class MemberRequestList extends StatefulWidget {
//   @override
//   _MemberRequestListState createState() => _MemberRequestListState();
// }

// class _MemberRequestListState extends State<MemberRequestList> {
//   List<MemberRequest> requests = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchMemberRequests(); // Fetch member requests when the widget initializes
//   }

//   Future<void> fetchMemberRequests() async {
//     try {
//       ViewMembersRecord viewMembersRecord = ViewMembersRecord();
//       List<dynamic> data = await viewMembersRecord.getMembersRecord();
//       List<MemberRequest> fetchedRequests = [];

//       // Convert backend data to MemberRequest objects
//       for (var record in data) {
//         fetchedRequests.add(MemberRequest(
//           rollNo: record['member'], // Assuming 'member' corresponds to 'rollNo'
//           club: record['club'],
//           remarks: record['remarks'],
//           description: record['description'],
//         ));
//       }

//       setState(() {
//         requests = fetchedRequests;
//       });
//     } catch (e) {
//       // Handle error
//       print('Error fetching member requests: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: requests.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Card(
//           child: ListTile(
//             title: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Roll No: ${requests[index].rollNo}'),
//                 Text('Club: ${requests[index].club}'),
//                 Text('Description: ${requests[index].description}'),
//                 Text('Remarks: ${requests[index].remarks}'),
//               ],
//             ),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle reject action
//                     // You can add your reject logic here
//                   },
//                   child: Text(
//                     'Reject',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.deepOrangeAccent,
//                   ),
//                 ),
//                 SizedBox(width: 10.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle approve action
//                     // You can add your approve logic here
//                   },
//                   child: Text(
//                     'Approve',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.deepOrangeAccent,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class MemberRequest {
//   final String rollNo;
//   final String club;
//   final String remarks;
//   final String description;

//   MemberRequest({
//     required this.rollNo,
//     required this.club,
//     required this.remarks,
//     required this.description,
//   });
// }

// void main() {
//   runApp(MaterialApp(
//     home: MemberRequestPage(),
//     theme: ThemeData(
//       primaryColor: Colors.black,
//       accentColor: Colors.deepOrangeAccent,
//     ),
//   ));
// }

import 'package:flutter/material.dart';
import 'package:fusion/services/viewmembersrecord.dart';
import 'package:fusion/services/approvemember.dart'; // Import ApproveMember class
import 'package:fusion/services/rejectmember.dart';

import '../../services/help.dart';
import '../LoginandDashboard/dashboard.dart'; // Import RejectMember class

class MemberRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Members Request',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
      ),
      body: MemberRequestList(),
    );
  }
}

class MemberRequestList extends StatefulWidget {
  @override
  _MemberRequestListState createState() => _MemberRequestListState();
}

class _MemberRequestListState extends State<MemberRequestList> {
  List<MemberRequest> requests = [];
  late String xx = "";
  @override
  void initState() {
    super.initState();
    // _initializeClubName();
    fetchMemberRequests();
  }

  // Future<void> _initializeClubName() async {
  //   // Update the UI after getting the club name
  // }

  Future<void> fetchMemberRequests() async {
    xx = await DataFetcher().getClub(context);
    print(xx);
    setState(() {});
    try {
      ViewMembersRecord viewMembersRecord = ViewMembersRecord();
      List<dynamic> data = await viewMembersRecord.getMembersRecord();
      List<MemberRequest> fetchedRequests = [];

      for (var record in data) {
        print("anu" + xx);
        if (record['status'] == 'open' && record['club'] == xx) {
          fetchedRequests.add(MemberRequest(
            rollNo: record['member'],
            club: record['club'],
            remarks: record['remarks'],
            description: record['description'],
            status: record['status'],
            id: record[
                'id'], // assuming 'id' is the field for the unique identifier
          ));
        }
      }

      setState(() {
        requests = fetchedRequests;
      });
    } catch (e) {
      print('Error fetching member requests: $e');
    }
  }

  Future<void> approveMember(int id) async {
    try {
      ApproveMember approveMember = ApproveMember();
      await approveMember.approveMember(id);
      // Refresh the list after approval
      fetchMemberRequests();
    } catch (e) {
      print('Error approving member: $e');
    }
  }

  Future<void> rejectMember(int id) async {
    try {
      RejectMember rejectMember = RejectMember();
      await rejectMember.rejectMember(id);
      // Refresh the list after rejection
      fetchMemberRequests();
    } catch (e) {
      print('Error rejecting member: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Roll No: ${requests[index].rollNo}'),
                Text('Club: ${requests[index].club}'),
                Text('Description: ${requests[index].description}'),
                Text('Remarks: ${requests[index].remarks}'),
                Text('Status: ${requests[index].status}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Approve button action
                    approveMember(requests[index].id);
                  },
                  child: Text(
                    'Approve',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                  ),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    // Reject button action
                    rejectMember(requests[index].id);
                  },
                  child: Text(
                    'Reject',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MemberRequest {
  final String rollNo;
  final String club;
  final String remarks;
  final String description;
  final String status;
  final int id;

  MemberRequest({
    required this.rollNo,
    required this.club,
    required this.remarks,
    required this.description,
    required this.status,
    required this.id,
  });
}

void main() {
  runApp(MaterialApp(
    home: MemberRequestPage(),
    theme: ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.deepOrangeAccent,
    ),
  ));
}
