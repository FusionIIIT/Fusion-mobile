import 'package:flutter/material.dart';
import 'package:fusion/Components/CustomAppBar.dart';
import 'package:fusion/constants.dart';



class GenerateResult extends StatefulWidget {
  const GenerateResult({Key? key}) : super(key: key);

  @override
  State<GenerateResult> createState() => _GenerateResultState();
}

class _GenerateResultState extends State<GenerateResult> {
  int? _curriculumValue;
  int? _batchValue;
  int? _branchValue;
  int? _semesterValue;

  void _handleDropdownChange(String dropdownName, int? value) {
    setState(() {
      switch (dropdownName) {
        case 'Curriculum':
          _curriculumValue = value;
          break;
        case 'Batch':
          _batchValue = value;
          break;
        case 'Branch':
          _branchValue = value;
          break;
        case 'Semester':
          _semesterValue = value;
          break;
      }
    });
  }

  Widget _buildDropdown(String name, List<DropdownMenuItem<int>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        DropdownButton<int>(
          elevation: 16,
          value: _getValueByName(name),
          isExpanded: true,
          hint: Text("-SELECT ITEM-"),
          items: items,
          onChanged: (value) {
            _handleDropdownChange(name, value);
          },
        ),
      ],
    );
  }



Widget createButton({required String buttonText, Function()? onPressed, bool showSearchIcon = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.all(16.0),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30.0)),
          ),
          child: Row(
            children: [
              Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              if (showSearchIcon) SizedBox(width: 10),
              if (showSearchIcon) Icon(Icons.search, color: Colors.white),
            ],
          ),
        ),
      ),
    ],
  );
}





  int? _getValueByName(String name) {
    switch (name) {
      case 'Curriculum':
        return _curriculumValue;
      case 'Batch':
        return _batchValue;
      case 'Branch':
        return _branchValue;
      case 'Semester':
        return _semesterValue;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "Generate Result").buildAppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdown(
              'Curriculum',
              [
                DropdownMenuItem(child: Text("Dr Tony Gupta"), value: 1),
                DropdownMenuItem(child: Text("Dr Hrishi Goyal"), value:2),
                DropdownMenuItem(child: Text("Dr Preeti Singh"), value:3),
              ],
            ),
            SizedBox(height: 20),
            _buildDropdown(
              'Batch',
              [
                DropdownMenuItem(child: Text("Batch A"), value: 1),
                DropdownMenuItem(child: Text("Batch B"), value: 2),
                DropdownMenuItem(child: Text("Batch C"), value: 3),
              ],
            ),
            SizedBox(height: 20),
            _buildDropdown(
              'Branch',
              [
                DropdownMenuItem(child: Text("Branch CSE"), value: 1),
                DropdownMenuItem(child: Text("Branch ECE"), value: 2),
                DropdownMenuItem(child: Text("Branch ME"),  value: 3),
                DropdownMenuItem(child: Text("Branch SM"),  value: 4),
                DropdownMenuItem(child: Text("Branch DS"),  value: 5),
              ],
            ),
            SizedBox(height: 20),
            _buildDropdown(
              'Semester',
              [
                DropdownMenuItem(child: Text("Semester 1"), value: 1),
                DropdownMenuItem(child: Text("Semester 2"), value: 2),
                DropdownMenuItem(child: Text("Semester 3"), value: 3),
                DropdownMenuItem(child: Text("Semester 4"), value: 4),
                DropdownMenuItem(child: Text("Semester 5"), value: 5),
                DropdownMenuItem(child: Text("Semester 6"), value: 6),
                DropdownMenuItem(child: Text("Semester 7"), value: 7),
                DropdownMenuItem(child: Text("Semester 8"), value: 8),
              ],
            ),
            SizedBox(height: 20),

            
            createButton(buttonText: 'Search' ,onPressed: () => {}, showSearchIcon: true),


            SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Result are not yet verified to generate"),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Please Verify the result"),
              ),
              SizedBox(height: 20),


              createButton(buttonText: 'Generate' ,onPressed: () => {}),


          ],
        ),
      ),
    );
  }
}
