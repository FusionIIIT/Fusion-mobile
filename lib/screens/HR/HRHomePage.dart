//create a home page for the HR module containing 6 list items
import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/HR/ApplyForCPDAadv.dart';
import 'package:fusion/screens/HR/ApplyForCPDArbrse.dart';
import 'package:fusion/screens/HR/ApplyForAppraisal.dart';
import 'package:fusion/screens/HR/ApplyForLTC.dart';
import 'package:fusion/screens/HR/ApplyForLeave.dart';
import 'package:fusion/screens/HR/Approve_Decline_CPDAadv_director.dart';
import 'package:fusion/screens/HR/ForwardOrDeclineFormCPDAHOD.dart';
import 'package:fusion/screens/HR/Forward_Decline_CPDAadv_Hradmin.dart';
import 'package:fusion/screens/HR/Forward_Decline_CPDAadv_Audit.dart';
import 'package:fusion/screens/HR/Request_list.dart';
import 'package:fusion/screens/HR/Forward_Appraisal_Hod.dart';
import 'package:fusion/screens/HR/Forward_Appraisal_Director.dart';
import 'package:fusion/screens/HR/Forward_Decline_LTC_Hod.dart';
import 'package:fusion/screens/HR/Approve_Decline_LTCDirector.dart';

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
            'Approve and Decline CPDA Advance By Director',
            ApproveOrDeclineFormDirector(),
          ),
          _buildListTile(
            context,
            Icons.assignment,
            'Forward and Decline CPDA Advance By HR Admin',
            ForwardOrDeclineFormHradmin(),
          ),
          _buildListTile(
            context,
            Icons.assignment,
            'Forward and Decline CPDA Advance By Audit Officer',
            ForwardOrDeclineFormAudit(),
          ),
          _buildListTile(
            context,
            Icons.assignment,
            'View Requests',
            RequestListPage(),
          ),
          _buildListTile(
            context,
            Icons.assignment,
            'Forward Appraisal to HOD',
            ForwardAppraisalHod(),
          ),
          _buildListTile(
            context,
            Icons.assignment,
            'Forward Appraisal to Director',
            ForwardAppraisalDirector(),
          ),
          _buildListTile(
            context,
            Icons.assignment,
            'Forward LTC to HOD',
            ForwardLTCHod(),
          ),
          _buildListTile(
            context,
            Icons.assignment,
            'Forward LTC to Director',
            ApproveOrDeclineLTCDirector(),
          )
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
