import 'package:flutter/material.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class FacilitiesPage extends StatefulWidget {
  @override
  _FacilitiesPageState createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage>
    with SingleTickerProviderStateMixin {
  ProfileData? data;
  late TabController _tabController;
  TextEditingController _updateController = TextEditingController();

  void initState() {
    super.initState();
    var service = locator<StorageService>();
    data = service.profileData;

    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.addListener(_handleTabSelection);
    _tabController.index = 0;
  }

  void _handleTabSelection() {
    // You can perform actions when a tab is selected if needed
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String centralLibraryInfo =
      "Institute library has e-resources through INDEST, Science Direct, IEEE, ACM, Springger Link, Nature and ASME. The Institute also has access to various online research journals & articles like the following resources SIAm, AMS, ACS, Kluwer, APS, Palgrave, INFORMS, Rev. of Scientific Instruments, Appl. Physics Letters and the search engine Scopus. Total number of books in the Institute library by the year 2009-10 are approximately 6742.";

  String labInfraInfo =
      "Lab Infrastructure: This Laboratory contains Rapid Prototyping Machine, CNC Controlled Abrasive Waterjet Machine, CNC Milling Center, CNC Turning Center, Dynamometer, Electro Chemical Machining System, Injection Moulding Machine etc.";

  @override
  Widget build(BuildContext context) {
    String? userRole = data?.profile?['user_type'];
    bool isAdmin = userRole == 'admin';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Facilities',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 6.0,
          controller: _tabController,
          tabs: [
            Tab(
              child: Container(
                child: Text(
                  'Central Library',
                ),
              ),
            ),
            Tab(
              child: Container(
                child: Text(
                  'Lab Infrastructure',
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: SideDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Central Library Tab
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              if (isAdmin)
                TextFormField(
                  controller: _updateController,
                  decoration: InputDecoration(
                    labelText: 'Update Library Information',
                  ),
                ),
              Text(
                isAdmin ? _updateController.text : centralLibraryInfo,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),

          // Lab Infrastructure Tab
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Text(
                'Lab Infrastructure:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                isAdmin ? _updateController.text : labInfraInfo,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
