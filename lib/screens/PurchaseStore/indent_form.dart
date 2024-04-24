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

class IndentForm extends StatefulWidget {
  const IndentForm({Key? key}) : super(key: key);

  @override
  State<IndentForm> createState() => _IndentFormState();
}

class _IndentFormState extends State<IndentForm> {
  var service = locator<StorageService>();
  late String curr_desig = service.getFromDisk("Current_designation");

  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController presentStockController = TextEditingController();
  TextEditingController estimatedCostController = TextEditingController();
  TextEditingController purchaseJustificationController = TextEditingController();
  TextEditingController itemTypeController = TextEditingController();
  TextEditingController replaceDetailsController = TextEditingController();
  TextEditingController budgetaryHeadController = TextEditingController();
  TextEditingController expectedDeliveryController = TextEditingController();
  TextEditingController sourceOfSupplyController = TextEditingController();
  TextEditingController forwardToController = TextEditingController();
  TextEditingController receiverDesignationController = TextEditingController();
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
            buildTextField("Name of the indenter", nameController),
            SizedBox(height: 10),
            buildTextField("Item Name", itemNameController),
            SizedBox(height: 10),
          TextField(
            controller: designationController,
            enabled: false, // Disable editing
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: curr_desig,
            ),
          ),
            SizedBox(height: 10),


            buildTextField("Quantity", quantityController),
            SizedBox(height: 10),
            buildTextField("Present Stock", presentStockController),
            SizedBox(height: 10),
            buildTextField("Estimated Cost", estimatedCostController),
            SizedBox(height: 10),
            buildTextField("Purchase & Justification", purchaseJustificationController),
            SizedBox(height: 10),
            buildTextField("Item Type", itemTypeController),
            SizedBox(height: 10),
            buildTextField("If Replace(give details)", replaceDetailsController),
            SizedBox(height: 10),
            buildTextField("Budgetary Head", budgetaryHeadController),
            SizedBox(height: 10),
            buildTextField("Expected Delivery", expectedDeliveryController),
            SizedBox(height: 10),
            buildTextField("Source of Supply", sourceOfSupplyController),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                pickAttachment();
              },
              child: Text(
                'Attach File',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
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

  Widget buildTextField(String label, TextEditingController controller) {
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

