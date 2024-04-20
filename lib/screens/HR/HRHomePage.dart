//create a home page for the HR module containing 6 list items
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/HR/ApplyForCPDAadv.dart';
import 'package:fusion/screens/HR/ApplyForCPDArbrse.dart';
import 'package:fusion/screens/HR/ApplyForAppraisal.dart';
import 'package:fusion/screens/HR/ApplyForLTC.dart';
import 'package:fusion/screens/HR/ApplyForLeave.dart';
import 'package:fusion/screens/HR/ForwardCPDAAdvance.dart';
import 'package:fusion/screens/HR/UpdateLeaveBalance.dart';
import 'package:fusion/screens/HR/ViewArchive.dart';
import 'package:fusion/screens/HR/ViewHistoryOfUser.dart';
import 'package:fusion/screens/HR/ViewInbox.dart';
import 'package:fusion/screens/HR/ForwardAppraisal.dart';
import 'package:fusion/screens/HR/ForwardLTC.dart';
import 'package:fusion/screens/HR/ViewOutbox.dart';

class HRHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: ListView(
        children: <Widget>[
          _buildListTile(
            context,
            Icons.assignment,
            'Apply For LTC',
            ApplyForLTC(),
          ),
          _buildListTile(
            context,
            Icons.rate_review,
            'Apply For Appraisal',
            ApplyForAppraisal(),
          ),
          _buildListTile(
            context,
            Icons.attach_money,
            'Apply For CPDA Advance',
            ApplyForCPDAadv(),
          ),
          _buildListTile(
            context,
            Icons.money_off,
            'Apply For CPDA Reimbursement',
            ApplyForCPDArbrse(),
          ),
          _buildListTile(
            context,
            Icons.date_range,
            'Apply For Leave',
            ApplyForLeave(),
          ),
          _buildListTile(
            context,
            Icons.assignment,
            'View Inbox',
            RequestListPage(),
          ),
          _buildListTile(
            context,
            Icons.assignment,
            'View Outbox',
            ViewOutbox(),
          ),
          _buildListTile(
            context,
            Icons.assignment,
            'View Archived Forms',
            ViewArchive(),
          ),
          _buildListTile(
            context,
            Icons.assignment,
            'View History of a User',
            ViewHistoryOfUser(),
          ),
          _buildListTile(
            context,
            Icons.assignment,
            'Check Leave Balance',
            UpdateLeavebalance(),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Icon(
        icon,
        size: 48.0, // Adjust the size of the icon as needed
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.0, // Adjust the size of the title as needed
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
