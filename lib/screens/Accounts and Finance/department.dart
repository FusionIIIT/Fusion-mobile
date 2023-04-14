import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/finance_department.dart';
import '../../services/finance_service.dart';

class DepartMent extends StatefulWidget {
  const DepartMent({Key? key}) : super(key: key);

  @override
  State<DepartMent> createState() => _DepartMentState();
}

class _DepartMentState extends State<DepartMent> {
  DateTime selectedDate = DateTime.now();

  getCompanyStatus(DepartmentModel model)async{
    try{
      var response=await FinanceService().getCompanyStatus(model);
      setState(() {
        // update status from here
      });
    }catch(e){
      print(e);
    }
  }

  // text fields
  TextEditingController _companyNameController=TextEditingController();
  TextEditingController _startDateController=TextEditingController();
  TextEditingController _endDateController=TextEditingController();
  TextEditingController _descController=TextEditingController();
  TextEditingController _statusController=TextEditingController();


  // date picker code
  Future<void> _selectDate(BuildContext context) async {

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(selectedDate.year-1, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                // Company name
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("Company Name",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _companyNameController,
                    decoration: InputDecoration(
                      hintText: "",
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Start date
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text("Start Date",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _startDateController,
                    decoration: InputDecoration(
                      hintText: "",
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_month),
                        onPressed: (){
                          _selectDate(context);
                          _startDateController.text=DateFormat('dd-MM-yyyy').format(selectedDate);
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // End date
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("End Date",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _endDateController,
                    decoration: InputDecoration(
                      hintText: "",
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_month),
                        onPressed: (){
                          _selectDate(context);
                          _endDateController.text=DateFormat('dd-MM-yyyy').format(selectedDate);
                          },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Descriptions
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("Description",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _descController,
                    decoration: InputDecoration(
                      hintText: "",
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Center(
                    child:SizedBox(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                           side: BorderSide(width: 1,color: Colors.white,),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                        onPressed: (){
                          var model=DepartmentModel(companyName: _companyNameController.text, startDate: _startDateController.text, description: _descController.text, endDate: _endDateController.text);
                          getCompanyStatus(model);
                        },
                        child: Text('status',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                    )
                ),

                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Your status:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
              ],
            ),
          ),
        );
  }
}