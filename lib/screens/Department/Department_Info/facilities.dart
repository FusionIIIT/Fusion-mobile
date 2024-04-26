import 'package:flutter/material.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/screens/Department/Department_Info/updateinfo.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class FacilitiesPage extends StatefulWidget {
  final String selectedDepartment;
  FacilitiesPage({required this.selectedDepartment});
  @override
  _FacilitiesPageState createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage>
    with SingleTickerProviderStateMixin {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  ProfileData? data;
  late TabController _tabController;

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

  void _handleTabSelection() {}

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String centralLibraryInfo;
    String labInfraInfo;

    switch (widget.selectedDepartment) {
      case 'CSE Department':
        centralLibraryInfo =
            "Institute library has e-resources through INDEST, Science Direct, IEEE, ACM, Springger Link, Nature and ASME. The Institute also has access to various online research journals & articles like following resources SIAm, AMS, ACS, Kluwer, APS, Palgrave, INFORMS, Rev.of Scientific Instruments, Appl.Physics Letters and the search engine Scopus. Total number of books in the Institute library by the year 2009-10 are approximately 6742.\n\nHigh Performance Computing Labortory : Specification of Parallel Cluster (for Central Computing Facility)- JS22 Blade No.3, 16GB(2*8GB) DDR2 533 Mhz DiMMs, IBM 146GB SAS 10K SFF HDD, IBM blade center JS22 4-core 4.0 Ghz Processor and WiFi Campus etc.";
        labInfraInfo =
            "1. Advanced Manufacturing Laboratory : This Laboratory contains Rapid Prototyping Machine, CNC Controlled Abrasive Waterjet Machine, CNC Milling Center, CNC Turning Center, Dynamometer, Electro Chemical Machining System, Injection Moulding Machine etc.\n\n2. Biometric Laboratory : This Laboratory contains S Series, H Series, W Series cameras and p6 p520(Tower Model), p6 p520:8203 Model servers Made by IBM etc.\n\n3. Digital Signal Processing and Image Processing Laboratory : This Laboratory contains DSP Starter SPARTAN-3 kit (DSK), TMS 320C6713 DSK with CCS (Code Composer Studio), Image Daughter Kit with CCD Cameras, Bloom with DSP, Matrox Imaging Library, Matrox Morphis, Frame Graber Card, Color CCD Camera for online Processing etc.\n\n4. Infrared Imaging Laboratory : This Laboratory contains Radiometeric calibration, Extender rings, NDT Base Module, Central computing unit with TFT display, Software Modules for Lockin, Transient-and Pulse Measurement, Module Pulse- and Transient- Thermography, Source for Vibro- Thermography etc.\n\n5. Materials Research Laboratory : This Laboratory contains three important instruments for material characterization which are X-Ray Diffractometer (XRD), Scanning Electron Microscope (SEM) and Atomic Force Microscope (AFM) including SPM, MFM etc.";
        break;
      case 'ECE Department':
        centralLibraryInfo = "ECE Department Central Library Info";
        labInfraInfo = "ECE Department Lab Infrastructure Info";
        break;
      case 'ME Department':
        centralLibraryInfo = "ME Department Central Library Info";
        labInfraInfo = "ME Department Lab Infrastructure Info";
        break;
      case 'SM Department':
        centralLibraryInfo = "SM Department Central Library Info";
        labInfraInfo = "SM Department Lab Infrastructure Info";
        break;
      default:
        centralLibraryInfo = "No information available";
        labInfraInfo = "No information available";
    }

    bool isHODForSelectedDepartment =
        _isHODForDepartment(curr_desig, widget.selectedDepartment);
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
      drawer: SideDrawer(
        curr_desig: curr_desig,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              SizedBox(height: 16),
              Text(
                centralLibraryInfo,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              SizedBox(height: 16),
              Text(
                labInfraInfo,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: isHODForSelectedDepartment
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateInfoPage(),
                  ),
                );
              },
              label: Text('Update Department Info'),
            )
          : null,
    );
  }
}

bool _isHODForDepartment(String currDesig, String selectedDepartment) {
  switch (selectedDepartment) {
    case 'CSE Department':
      return currDesig == 'HOD (CSE)';
    case 'ECE Department':
      return currDesig == 'HOD (ECE)';
    case 'ME Department':
      return currDesig == 'HOD (ME)';
    case 'SM Department':
      return currDesig == 'HOD (SM)';
    default:
      return false;
  }
}
