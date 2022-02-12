import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import '../Constants/constants.dart';

class ComplaintFeedBack extends StatefulWidget {
  @override
  _ComplaintFeedBackState createState() => _ComplaintFeedBackState();
}

class _ComplaintFeedBackState extends State<ComplaintFeedBack> {
  DateTime? pickedDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickedDate = DateTime.now();
  }

  _pickDate() async {
    DateTime date = (await showDatePicker(
      context: context,
      initialDate: pickedDate!,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    ))!;

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Feedback",
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Card(
          elevation: 2.0,
          // margin: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shadowColor: Colors.black,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Date',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                        '${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}'),
                  ),
                  leading: Icon(
                    Icons.calendar_today_sharp,
                  ),
                  onTap: _pickDate,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Complaint Type',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Complaint Details *',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Status',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Workers Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'ComplaintFeedBack',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  maxLines: 6,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Default Text",
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, otherwise false.
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.deepOrange;
                          return Colors
                              .deepOrangeAccent; // Use the component's default.
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
