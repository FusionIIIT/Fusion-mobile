import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpenditure extends StatefulWidget {
  const AddExpenditure({Key? key}) : super(key: key);

  @override
  State<AddExpenditure> createState() => _AddExpenditureState();
}

class _AddExpenditureState extends State<AddExpenditure> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  var _dateController=TextEditingController();

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
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // income source
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Spend on",
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    )
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter where it spend";
                  }
                  return null;
                },
              ),

              // amount
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Add amount",
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    )
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter amount";
                  }
                  return null;
                },
              ),

              SizedBox(height: 10,),
              // date
              TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  hintText: "mm/dd/yyyy",
                  contentPadding:
                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_month),
                    onPressed: (){
                      _selectDate(context);
                      _dateController.text=DateFormat('MM-dd-yyyy').format(selectedDate);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //remark
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Add some remark",
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    )
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // submit button
              ElevatedButton(onPressed: (){},
                child:Text("Add Expenditure",style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
              )

            ],
          ),
        )
    );
  }
}
