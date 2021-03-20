import 'package:flutter/material.dart';

class AddThesis extends StatefulWidget {
  @override
  _AddThesisState createState() => _AddThesisState();
}

class _AddThesisState extends State<AddThesis> {
  final List visors = [
    "Dr. Subir Simgh Lamba",
    "Dr. Mukesh Kumar Roy",
    "Dr. Bhupendra Gupta",
    "Dr. H Chelladurai",
    "Dr. M Amarnath",
    "Dr. Lokendra Kumar Balyan",
    "Dr. Anil Kumar",
    "Dr. Sraban Kumar Mohanty",
    "Dr. Mamta Anand",
    "Dr. Pavan Kumar Kankar",
    "Dr. Nihar Ranjan Jena",
    "Dr. Sujoy Mukherjee",
    "Dr. Amresh Chandra Mishra",
    "Dr. Sangeeta Pandit",
    "Dr. Shekhar Chaterjee",
    "Dr. Manoj Singh Parihar",
    "Dr. Sachin Kumar Jain",
    "Dr. Manish Kumar Bajpai",
    "Dr. Vinod Kumar Jain",
    "Dr. Matadeen Bansal",
    "Dr. Nihar Kumar Mahato",
    "Dr. Manoj Kumar Panda",
    "Dr. Neeraj Kumar Jaiswal",
    "Dr. Varun Bajaj",
    "Dr. Mohd. Azhid Ansari",
    "Dr. Biswajeet Mukherjee",
    "Dr. Dheeraj Sharma",
    "Dr. Kusum Kumari Bharti",
    "Dr. Deepmala",
    "Dr.Yashapal Singh Kataria",
    "Dr. Samrat Rao",
    "Dr. Dip Prakash Samajdar",
    "Dr. Harpreet Singh",
    "Dr. Atul Kumar",
    "Dr. Shivdayal Patel",
    "Dr. Mohona Ghosh",
    "Dr. Irshad Ahmad Ansari",
    "Dr. Tripti Singh",
    "Dr. Ravi Panwar",
    "Prof. Aparajita Singh",
    "Prof. Puneet Tandon",
    "Prof. Tanuja Sheorey",
    "Dr. Vijay Kumar Gupta",
    "Prof. P N Kondekar",
    "Dr. Pritee Khanna",
    "Dr. Dinesh Kr. Vishwakarma",
    "Dr. Prabir Mukhopadhyay",
    "Dr. Jawar Singh",
    "Dr. Ashish Kumar Kundu",
    "Awadesh Kumar Singh",
    "Vijay Kumar Gupta"
  ];

  List<DropdownMenuItem<int>> _supervisorItems = [];
  List<DropdownMenuItem<int>> _cosupervisorItems = [];
  int selecteditem=0;
  int coselecteditem=0;
  List<ListItem> _supervisors = [];
  List<ListItem> _cosupervisors = [];

  void loadSuprevisorList() {
    _supervisors = [];
    _cosupervisors = [];
    _supervisorItems = [];
    _cosupervisorItems = [];
    for (int i = 0; i < visors.length; i++) {
      _supervisors.add(ListItem(i, visors[i]));
      // _cosupervisors.add(ListItem(i + 1, visors[i]));
    }
    for (ListItem listItem in _supervisors) {
      _supervisorItems.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem.value,
        ),
      );
    }
    for (ListItem listItem in _cosupervisors) {
      _cosupervisorItems.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem.value,
        ),
      );
    }
  }

  // void selectSupervisor() {
  //   _coselectedItem = 0;
  //
  // }

  String courseCode = "";
  String researchArea = "";
  String theme = "";
  String supervisor = "";
  String cosupervisor = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    loadSuprevisorList();
    return SingleChildScrollView(
      child: Container(
          child: Form(
        key: _formKey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              items: null,
              onChanged: null,
              disabledHint: Text("Course Code"),
              isExpanded: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Your Broad Research Area",
              ),
              validator: (String? value) {
                if (value!.isEmpty) return "Required";
              },
              onSaved: (value) {
                researchArea = value!;
              },
            ),
          ),
          Container(
            height: 100.0,
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Theme of Proposed Research Work",
              ),
              maxLines: 50,
              validator: (String? value) {
                if (value!.isEmpty) return "Required";
              },
              onSaved: (value) {
                theme = value!;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<int>(
              items: _supervisorItems,
              value: selecteditem,
              decoration: InputDecoration(
                labelText: "Supervisor"
              ),
              onChanged: (value) {
                setState(() {
                  supervisor = _supervisors[value!].name;
                  selecteditem=value;
                });
              },
              isExpanded: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<int>(
              value: coselecteditem,
              items: _supervisorItems,
              decoration: InputDecoration(
                  labelText: "Co-Supervisor"
              ),
              onChanged: (value) {
                setState(() {
                  cosupervisor = _supervisors[value!].name;
                  coselecteditem=value;
                });
              },
              isExpanded: true,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
            child: Text("Add Thesis"),
          ),
        ]),
      )),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
