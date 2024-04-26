import 'package:flutter/material.dart';
import 'package:fusion/services/viewclubdetails.dart';
import 'package:fusion/services/change_club_position.dart';
import '../../services/viewmembersrecord.dart';

class ManagePositionHolderPage extends StatefulWidget {
  @override
  _ManagePositionHolderPageState createState() =>
      _ManagePositionHolderPageState();
}

class _ManagePositionHolderPageState extends State<ManagePositionHolderPage> {
  List<String> clubs = [];
  String? selectedClub;
  List<String> clubMembers = [];
  String? selectedCoordinator;
  String? selectedCoCoordinator;
  late TextEditingController coordinatorController;
  late TextEditingController coCoordinatorController;

  @override
  void initState() {
    super.initState();
    coordinatorController = TextEditingController();
    coCoordinatorController = TextEditingController();
    _fetchClubDetails();
  }

  

  Future<void> _fetchClubDetails() async {
  try {
    ViewClubDetails viewClubDetails = ViewClubDetails();
    List<dynamic> clubData = await viewClubDetails.getClubDetails();

    // Filter club details with status 'confirmed' or handle null status
    List<dynamic> filteredData = clubData.where((club) => club['status'] == 'confirmed' || club['status'] == null).toList();

    // Extract club names from filtered club details and cast to String
    List<String> fetchedClubs =
        filteredData.map((club) => club['club_name'].toString()).toList();
    setState(() {
      clubs = fetchedClubs;
      selectedClub = clubs.isNotEmpty ? clubs.first : null;
    });
  } catch (e) {
    print('Error fetching club details: $e');
  }
}


  Future<void> _fetchClubMembers() async {
    try {
      if (selectedClub != null) {
        ViewMembersRecord viewMembersRecord = ViewMembersRecord();
        List<dynamic> membersData = await viewMembersRecord.getMembersRecord();
        List<String> members = membersData
            .where((member) =>
                member['status'].toLowerCase() == 'confirmed' &&
                member['club'] == selectedClub)
            .map((member) => member['member'].toString())
            .toList();
        setState(() {
          clubMembers = members;
          selectedCoordinator =
              clubMembers.isNotEmpty ? clubMembers.first : null;
          selectedCoCoordinator =
              clubMembers.isNotEmpty ? clubMembers.first : null;
        });
      }
    } catch (e) {
      print('Error fetching club members: $e');
    }
  }

  Future<void> _updatePositions() async {
    try {
      if (selectedClub != null) {
        String coordinator = coordinatorController.text;
        String coCoordinator = coCoordinatorController.text;
        await ChangeClubPositionService().changeClubPosition(
          clubName: selectedClub!,
          coordinator: coordinator,
          coCoordinator: coCoordinator,
        );
        _showSnackbar('Positions updated successfully', true);
      } else {
        _showSnackbar('Please select a club', false);
      }
    } catch (e) {
      print('Error updating positions: $e');
      _showSnackbar('Error updating positions', false);
    }
  }

  void _showSnackbar(String message, bool isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Position Holders',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedClub,
              onChanged: (newValue) {
                setState(() {
                  selectedClub = newValue;
                });
                _fetchClubMembers();
              },
              items: clubs.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Select Coordinator:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedCoordinator,
              onChanged: (newValue) {
                setState(() {
                  selectedCoordinator = newValue;
                  coordinatorController.text = newValue ?? '';
                });
              },
              items: clubMembers.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Text(
              'Select Co-Coordinator:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedCoCoordinator,
              onChanged: (newValue) {
                setState(() {
                  selectedCoCoordinator = newValue;
                  coCoordinatorController.text = newValue ?? '';
                });
              },
              items: clubMembers.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updatePositions();
              },
              child: Text('Update Positions'),
            ),
          ],
        ),
      ),
    );
  }
}
