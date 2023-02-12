import 'package:flutter/material.dart';

class DepartMent extends StatefulWidget {
  const DepartMent({Key? key}) : super(key: key);

  @override
  State<DepartMent> createState() => _DepartMentState();
}

class _DepartMentState extends State<DepartMent> {
  TextEditingController _companyNameController=TextEditingController();
  TextEditingController _startDateController=TextEditingController();
  TextEditingController _endDateController=TextEditingController();
  TextEditingController _descController=TextEditingController();
  TextEditingController _statusController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                // Company name
                Padding(
                  padding: const EdgeInsets.only(left: 0.0,top: 0.0),
                  child: Text("Company Name :",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _companyNameController,
                  decoration: InputDecoration(
                    hintText: "",
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Start date

                Padding(
                  padding: const EdgeInsets.only(left: 0.0,top: 10.0),
                  child: Text("Start Date :",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _startDateController,
                  decoration: InputDecoration(
                    hintText: "DD/MM/YYYY",
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // End date
                Padding(
                  padding: const EdgeInsets.only(left: 0.0,top: 10.0),
                  child: Text("End Date :",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _endDateController,
                  decoration: InputDecoration(
                    hintText: "DD/MM/YYYY",
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Descriptions
                Padding(
                  padding: const EdgeInsets.only(left: 0.0,top: 10.0),
                  child: Text("Description :",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _descController,
                  decoration: InputDecoration(
                    hintText: "",
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Status
                // month
                Padding(
                  padding: const EdgeInsets.only(left: 0.0,top: 10.0),
                  child: Text("Status",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  controller: _statusController,
                  decoration: InputDecoration(
                    hintText: "",
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),



                Center(
                    child:TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                      ),
                      onPressed: (){},
                      child: Text("Print", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                    )
                )
              ],
            ),
          ),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            shadowColor: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, 'account_finance/department');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Department',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(
                          context, 'account_finance/bank_detail');
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bank Details',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, 'account_finance/view_salary');
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'View Salary',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2),
              ],
            ),
          ),],
      ),

    );
  }
}