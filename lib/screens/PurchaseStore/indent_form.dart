import 'package:flutter/material.dart';

void main() {
  runApp(IndentForm());
}



class IndentForm extends StatefulWidget {
  const IndentForm({Key? key}) : super(key: key);

  @override
  State<IndentForm> createState() => _IndentFormState();
}

class _IndentFormState extends State<IndentForm> {
  // Create controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
      backgroundColor:  Colors.deepOrangeAccent,
        title: Text(
          "indent Form",
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
            const Text('Name of the indenter'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Designation'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Item Name'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: mobileController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Item Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Quantity'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Quantity',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text('Present Stock'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Present Stock',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text('Estimated  Cost'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Estimated Cost',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text('Purchase & Justification'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text('Item Type'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text('If Replace(give details)'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text('Budgetary head'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text('Expected Delivery'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text('Source of Supply'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text('Attach File'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text('Forward To'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text('Receiver Designation'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '',
              ),
            ),
            SizedBox(
              height: 10,
            ),








            ElevatedButton(
              onPressed: () {
                // Print input
                print(nameController.text);
                print(emailController.text);
                print(mobileController.text);
                print(addressController.text);
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
