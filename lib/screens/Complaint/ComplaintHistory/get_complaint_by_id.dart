import 'package:flutter/material.dart';
import 'package:fusion/Components/utils.dart';
import 'package:fusion/services/complaint_service.dart';

class GetComplaintByID extends StatefulWidget {
  final Map<String, dynamic> data;
  GetComplaintByID(this.data);
  @override
  _GetComplaintByIDState createState() => _GetComplaintByIDState();
}

class _GetComplaintByIDState extends State<GetComplaintByID> {
  Utils utils = Utils();
  final feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: utils.leadingPopIconsButton(utils.primarycolor, context),
        title: Text(
          "Complaint Details",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: utils.primarycolor),
        ),
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: utils.containerBorder(utils.primarycolor),
            child: Column(
              children: <Widget>[
                Text(
                  "Complainer Details ",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.7)),
                ),
                Container(
                  color: utils.primarycolor,
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                ),
                paddwithchoice(10),
                detailabout(" Id : ", widget.data["complainer"].toString()),
                paddwithchoice(25),
                Text(
                  "Complaint Details  ",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.7)),
                ),
                Container(
                  height: 1,
                  color: utils.primarycolor,
                  width: MediaQuery.of(context).size.width,
                ),
                paddwithchoice(20),
                detailabout("Complaint Id:   ", widget.data["id"].toString()),
                paddBox(),
                detailabout("Complaint time:   ",
                    parsetime(widget.data["complaint_date"].toString())),
                paddBox(),
                detailabout("Complaint Date:   ",
                    widget.data["complaint_finish"].toString()),
                paddBox(),
                detailabout("Complaint Type:   ",
                    widget.data["complaint_type"].toString()),
                paddBox(),
                detailabout("Location:   ", widget.data["location"].toString()),
                paddBox(),
                detailabout("Specific Location:  ",
                    widget.data["specific_location"].toString()),
                paddBox(),
                detailabout(
                    "Full Details:  ", widget.data["details"].toString()),
                paddBox(),
                status(widget.data["status"]),
                paddBox(),
                detailabout(
                    "Remarks:  ",
                    widget.data["ramarks"] == null
                        ? "N/A"
                        : widget.data["ramarks"]),
                paddBox(),
                detailabout(
                    "Worker assigned:  ",
                    widget.data["worker_id"] == null
                        ? "Not Assigned"
                        : widget.data["worker_id"].toString()),
                paddwithchoice(30),
                Text(
                  "Comments and Feedback",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.7)),
                ),
                Container(
                  color: utils.primarycolor,
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                ),
                paddwithchoice(20),
                if (widget.data["feedback"] == "" &&
                    widget.data["status"] == 2) ...[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Feedback:  ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                        Container(
                          // color: Colors.black.withOpacity(0.1),
                          alignment: Alignment.center,
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: TextField(
                            controller: feedbackController,
                            decoration: InputDecoration(
                                isCollapsed: true,
                                enabledBorder: InputBorder.none,
                                hintText: "give feedback"),
                            onSubmitted: (String value) async {
                              if (value != "") {
                                return showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("FeedBack.."),
                                        content: Text(value),
                                        actions: [
                                          TextButton(
                                              onPressed: () async {
                                                ComplaintService auth =
                                                    ComplaintService();
                                                bool lodge =
                                                    await auth.updateComplaint(
                                                  (widget.data["id"]),
                                                  widget.data["complaint_date"]
                                                      .toString(),
                                                  widget
                                                      .data["complaint_finish"]
                                                      .toString(),
                                                  widget.data["complaint_type"]
                                                      .toString(),
                                                  widget.data["location"]
                                                      .toString(),
                                                  widget
                                                      .data["specific_location"]
                                                      .toString(),
                                                  widget.data["details"]
                                                      .toString(),
                                                  widget.data["status"]
                                                      .toString(),
                                                  widget.data["remarks"]
                                                      .toString(),
                                                  widget.data["flag"]
                                                      .toString(),
                                                  widget.data["reason"]
                                                      .toString(),
                                                  value,
                                                  widget.data["comment"]
                                                      .toString(),
                                                  widget.data["complainer"]
                                                      .toString(),
                                                );
                                                final String completed =
                                                    "Thank you for your feedback";
                                                final String nc =
                                                    "Feedback not uploaded successfully, Kindly try after some time";
                                                final snackBar = SnackBar(
                                                  content: Text(
                                                    lodge == true
                                                        ? completed
                                                        : nc,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  backgroundColor: Colors.grey,
                                                  duration:
                                                      Duration(seconds: 1),
                                                  shape: StadiumBorder(),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                                Navigator.pop(context);
                                              },
                                              child: Text("Give Feedback")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("cancel"))
                                        ],
                                      );
                                    });
                              } else {
                                final snackBar = SnackBar(
                                  content: Text(
                                    'Feedback can not be empty.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  backgroundColor: Colors.grey,
                                  duration: Duration(seconds: 1),
                                  shape: StadiumBorder(),
                                  behavior: SnackBarBehavior.floating,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ] else ...[
                  detailabout(
                      "Feedback:  ",
                      widget.data["feedback"] == ""
                          ? "N/A"
                          : widget.data["feedback"]),
                ],
                paddBox(),
                detailabout(
                    "Comments:  ",
                    widget.data["comment"] == null
                        ? "N/A"
                        : widget.data["comment"]),
                paddwithchoice(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget detailabout(String type, String data) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            type,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.6)),
          ),
          Text(
            data,
            style: TextStyle(fontSize: 16, color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget paddBox() {
    return SizedBox(
      height: 5,
    );
  }

  Widget paddwithchoice(double height) {
    return SizedBox(
      height: height,
    );
  }
}

String parsetime(String data) {
  var date = DateTime.parse(data);
  if (date.hour <= 9 && date.minute <= 9) {
    return "0${date.hour} : 0${date.minute}";
  } else if (date.hour <= 9) {
    return "0${date.hour} : ${date.minute}";
  } else if (date.minute <= 9) {
    return "${date.hour} : 0${date.minute}";
  } else {
    return "${date.hour} : ${date.minute}";
  }
}

String parseDate(String data) {
  var date = DateTime.parse(data);
  return "${date.year} / ${date.month} / ${date.day}";
}

Widget status(int st) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Row(
      children: [
        Text(
          "Status: ",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.6)),
        ),
        getStatus(st),
        addIcon(st),
      ],
    ),
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
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 206, 155, 44)));
  } else if (i == 1) {
    return Text("On-Hold",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red));
  } else
    return Text("Completed",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green));
}
