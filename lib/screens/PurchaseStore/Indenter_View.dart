

import 'package:fusion/Components/appBar2.dart';
import 'package:fusion/Components/side_drawer2.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/Components/bottom_navigation_bar.dart';


import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class  IndentView extends StatefulWidget {
  const  IndentView({Key? key}) : super(key: key);

  @override
  State< IndentView> createState() => _IndentViewState();
}

class _IndentViewState extends State< IndentView> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  TextEditingController nameController = TextEditingController(text:"Shyam");
  TextEditingController designationController = TextEditingController(text:"Professor");
  TextEditingController mobileController = TextEditingController(text:"hello");
  TextEditingController itemNameController = TextEditingController(text:"Furniture");
  TextEditingController quantityController = TextEditingController(text:"10");
  TextEditingController presentStockController = TextEditingController(text:"5");
  TextEditingController estimatedCostController = TextEditingController(text:"15000");
  TextEditingController purchaseJustificationController = TextEditingController(text:"furniture is broken");
  TextEditingController itemTypeController = TextEditingController(text:"furniture");
  TextEditingController replaceDetailsController = TextEditingController(text:"No");
  TextEditingController budgetaryHeadController = TextEditingController(text:"");
  TextEditingController expectedDeliveryController = TextEditingController(text:"13-11-2025");
  TextEditingController sourceOfSupplyController = TextEditingController(text:"mahesh");
  TextEditingController forwardToController = TextEditingController();
  TextEditingController receiverDesignationController = TextEditingController();
  TextEditingController remarksController= TextEditingController();

  _IndentFormState() {
    designationController.text = curr_desig;
  }

  File? attachment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "Indent Form",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          shrinkWrap: true,
          children: [
            buildTextField("Name of the indenter", nameController,readOnly: true),
            SizedBox(height: 10),
            buildTextField("Item Name", itemNameController,readOnly:true),
            SizedBox(height: 10),
            buildTextField("Designation", designationController,readOnly:true),
            SizedBox(height: 10),
            SizedBox(height: 10),


            buildTextField("Quantity", quantityController,readOnly:true),
            SizedBox(height: 10),
            buildTextField("Present Stock", presentStockController,readOnly:true),
            SizedBox(height: 10),
            buildTextField("Estimated Cost", estimatedCostController,readOnly:true),
            SizedBox(height: 10),
            buildTextField("Purchase & Justification", purchaseJustificationController,readOnly:true),
            SizedBox(height: 10),
            buildTextField("Item Type", itemTypeController,readOnly:true),
            SizedBox(height: 10),
            buildTextField("If Replace(give details)", replaceDetailsController,readOnly:true),
            SizedBox(height: 10),
            buildTextField("Budgetary Head", budgetaryHeadController,readOnly:true),
            SizedBox(height: 10),
            buildTextField("Expected Delivery", expectedDeliveryController,readOnly:true),
            SizedBox(height: 10),
            buildTextField("Source of Supply", sourceOfSupplyController,readOnly:true),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                pickAttachment();
              },
              child: Text(
                'Attached  File',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            buildTextField("Remarks",remarksController ),
            SizedBox(height: 10),

            buildTextField("Forward To", forwardToController),
            SizedBox(height: 10),
            buildTextField("Receiver Designation", receiverDesignationController),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                submitForm();
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 20),

            attachment != null
                ? Text(
              'Attachment: ${attachment!.path}',
              style: TextStyle(fontSize: 16),
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, {bool readOnly = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          readOnly: readOnly, // Set readOnly property
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '',
          ),
        ),
      ],
    );
  }


  void pickAttachment() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        attachment = File(pickedFile.path);
      }
    });
  }

  void submitForm() async {
    var formData = {
      'name': nameController.text,
      'designation': designationController.text,
      'itemName': itemNameController.text,
      'quantity': quantityController.text,
      'presentStock': presentStockController.text,
      'estimatedCost': estimatedCostController.text,
      'purchaseJustification': purchaseJustificationController.text,
      'itemType': itemTypeController.text,
      'replaceDetails': replaceDetailsController.text,
      'budgetaryHead': budgetaryHeadController.text,
      'expectedDelivery': expectedDeliveryController.text,
      'sourceOfSupply': sourceOfSupplyController.text,
      'forwardTo': forwardToController.text,
      'receiverDesignation': receiverDesignationController.text,
    };

    if (attachment != null) {
      // formData['attachment'] = await http.MultipartFile.fromPath('attachment', attachment!.path);
    }

    var response = await http.post(
      Uri.parse('YOUR_API_ENDPOINT_HERE'),
      body: formData,
    );

    if (response.statusCode == 200) {
      // Form submitted successfully
      // Handle success scenario
    } else {
      // Form submission failed
      // Handle error scenario
    }
  }
}


