import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fusion/models/complaints.dart';
import 'package:fusion/services/complaint_service.dart';
import 'package:http/http.dart';

import '../../../Components/utils.dart';

class PendingComplaints extends StatefulWidget {
  @override
  _PendingComplaintsState createState() => _PendingComplaintsState();
}

class _PendingComplaintsState extends State<PendingComplaints> {
  bool _loading = true;
  Utils utils = Utils();
  late StreamController _complaintController;
  late ComplaintService complaintService;
  late ComplaintDataUserStudent data;
  int st = 3;
  String cuuItemp = "All";
  List item = ["All", "Pending", "On-hold", "Completed"];
  Map<String, int> map = {"All": 3, "Pending": 0, "On-hold": 1, "Completed": 2};
  @override
  void initState() {
    super.initState();
    _complaintController = StreamController();
    complaintService = ComplaintService();
    getData();
  }

  getData() async {
    //print('token-'+widget.token!);
    try {
      Response response = await complaintService.getComplaint();
      setState(() {
        data = ComplaintDataUserStudent.fromJson(jsonDecode(response.body));
        print("complain ${data.student_complain}");
        // print(object)
        //print(data);
        _loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  loadData() async {
    getData().then((res) {
      _complaintController.add(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: utils.primarybackgroundcolor,
          leading: utils.leadingPopIconsButton(utils.primarycolor, context),
          title: Text(
            "Complaints...",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: utils.primarycolor),
          ),
          actions: [
            Card(
              elevation: 1,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 110,
                child: DropdownButton(
                  value: cuuItemp,
                  underline: SizedBox(),
                  onChanged: (value) {
                    setState(() {
                      cuuItemp = value.toString();
                      st = map[cuuItemp]!;
                    });
                  },
                  items: item.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(
                              color: Colors.purple.withOpacity(0.7),
                              fontWeight: FontWeight.w600),
                        ));
                  }).toList(),
                ),
              ),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            getData();
            // Navigator.pop(context);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => PendingComplaints()));
          },
          child: _loading == true
              ? Center(child: CircularProgressIndicator())
              // FOr showing List of cards wich contains all data about Complaints
              : ListView.builder(
                  itemCount: data.student_complain?.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> _comp = data.student_complain?[index];
                    print(_comp);
                    return fun(st, _comp, context);
                  }),
        ));
  }
}

Widget fun(int obj, Map<String, dynamic> _data, BuildContext context) {
  if (obj != 3) {
    return complaintElement(_data, context, obj);
  } else
    return allElement(_data, context);
}

Widget complaintElement(
    Map<String, dynamic> _data, BuildContext context, int obj) {
  final ktextstyle = TextStyle(
      color: Colors.black.withOpacity(0.65),
      fontSize: 14,
      fontWeight: FontWeight.w700);
  if (_data["status"] == obj) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(
              color: Utils().primarycolor.withOpacity(0.6), width: 1.12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Complaint Id:  ${_data["id"]}",
                style: ktextstyle,
              ),
              Text(
                "Complaint Date:  ${_data["complaint_finish"]}",
                style: ktextstyle,
              )
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Type:  ${_data["complaint_type"]}",
                style: ktextstyle,
              ),
              status(_data["status"])
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Location:  ${_data["location"]}",
                style: ktextstyle,
              ),
              Text(
                "Worker assigned:  ${_data["worker_id"].toString()}",
                style: ktextstyle,
              )
            ],
          ),
          SizedBox(
            height: 13,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/complaint/fulldetail',
                    arguments: _data);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Utils().primarycolor.withOpacity(0.9),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Get full details",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
  return Container();
}

Widget allElement(Map<String, dynamic> _data, BuildContext context) {
  final ktextstyle = TextStyle(
      color: Colors.black.withOpacity(0.65),
      fontSize: 14,
      fontWeight: FontWeight.w700);
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
            color: Utils().primarycolor.withOpacity(0.6), width: 1.12)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Complaint Id:  ${_data["id"]}",
              style: ktextstyle,
            ),
            Text(
              "Complaint Date:  ${_data["complaint_finish"]}",
              style: ktextstyle,
            )
          ],
        ),
        SizedBox(
          height: 13,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Type:  ${_data["complaint_type"]}",
              style: ktextstyle,
            ),
            status(_data["status"])
          ],
        ),
        SizedBox(
          height: 13,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Location:  ${_data["location"]}",
              style: ktextstyle,
            ),
            Text(
              "Worker assigned:  ${_data["worker_id"].toString()}",
              style: ktextstyle,
            )
          ],
        ),
        SizedBox(
          height: 13,
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/complaint/fulldetail',
                  arguments: _data);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Utils().primarycolor.withOpacity(0.9),
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Get full details",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
              ),
            ))
      ]),
    ),
  );
}

Widget status(int st) {
  return Row(
    children: [
      Text(
        "Status: ",
        style: TextStyle(
            color: Colors.black.withOpacity(0.65),
            fontSize: 14,
            fontWeight: FontWeight.w700),
      ),
      addIcon(st),
      getStatus(st)
    ],
  );
}

Icon addIcon(int i) {
  if (i == 0) {
    return Icon(
      Icons.pending,
      color: Color.fromARGB(255, 206, 155, 44),
    );
  } else if (i == 1) {
    return Icon(
      Icons.motion_photos_pause_outlined,
      color: Colors.red,
    );
  } else {
    return Icon(
      Icons.check_circle,
      color: Colors.green,
    );
  }
}

Text getStatus(int i) {
  if (i == 0) {
    return Text("Pending",
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color.fromARGB(255, 206, 155, 44)));
  } else if (i == 1) {
    return Text("On-Hold",
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 14, color: Colors.red));
  } else
    return Text("Completed",
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 14, color: Colors.green));
}
