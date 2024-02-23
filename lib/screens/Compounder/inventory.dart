import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HealthCenterInventoryPage(),
  ));
}

class HealthCenterInventoryPage extends StatefulWidget {
  @override
  _HealthCenterInventoryPageState createState() =>
      _HealthCenterInventoryPageState();
}

class _HealthCenterInventoryPageState extends State<HealthCenterInventoryPage> {
  List<String> medicines = ['Medicine A', 'Medicine B', 'Medicine C'];
  String selectedMedicine = 'Medicine A';
  int stock = 0;
  String supplierName = '';
  DateTime expiryDate = DateTime.now();
  List<String> expiredMedicines = [];
  List<String> changes = [];

  TextEditingController newMedicineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Center Inventory'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Medicine to Update Stock:'),
            DropdownButton<String>(
              value: selectedMedicine,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMedicine = newValue!;
                });
              },
              items: medicines.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('Update Stock:'),
            TextField(
              decoration: InputDecoration(labelText: 'Stock'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  stock = int.parse(value);
                });
              },
            ),
            TextField(
              controller: TextEditingController(text: supplierName),
              decoration: InputDecoration(labelText: 'Supplier Name'),
              onChanged: (value) {
                setState(() {
                  supplierName = value;
                });
              },
            ),
            SizedBox(height: 10),
            Text('Expiry Date:'),
            SizedBox(
              height: 100,
              child: DatePicker(
                selectedDate: expiryDate,
                selectDate: (DateTime date) {
                  setState(() {
                    expiryDate = date;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateStock(selectedMedicine, stock, supplierName, expiryDate);
              },
              child: Text('Update Inventory'),
            ),
            SizedBox(height: 20),
            Text('Add New Medicine:'),
            TextField(
              controller: newMedicineController,
              decoration: InputDecoration(labelText: 'New Medicine Name'),
            ),
            ElevatedButton(
              onPressed: () {
                addNewMedicine(newMedicineController.text);
              },
              child: Text('Add Medicine'),
            ),
            SizedBox(height: 20),
            Text('Expired Medicines:'),
            Expanded(
              child: ListView.builder(
                itemCount: expiredMedicines.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(expiredMedicines[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Changes Made:'),
            Expanded(
              child: ListView.builder(
                itemCount: changes.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(changes[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateStock(String selectedMedicine, int stock, String supplierName,
      DateTime expiryDate) {
    setState(() {
      // Perform update
      String updateInfo =
          'Stock of $selectedMedicine updated to $stock. Supplier: $supplierName, Expiry Date: $expiryDate';
      changes.add(updateInfo);
    });
  }

  void addNewMedicine(String newMedicineName) {
    setState(() {
      medicines.add(newMedicineName);
      changes.add('New medicine added: $newMedicineName');
    });
  }
}

class DatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> selectDate;

  DatePicker({required this.selectedDate, required this.selectDate});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    ))!;
    if (picked != selectedDate) selectDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextButton(
            onPressed: () => _selectDate(context),
            child: Text(
              '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
            ),
          ),
        ),
      ],
    );
  }
}
