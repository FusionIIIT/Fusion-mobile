import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Guestroom(),
  ));
}

class Guestroom extends StatefulWidget {
  const Guestroom({Key? key}) : super(key: key);

  @override
  _GuestroomState createState() => _GuestroomState();
}

class _GuestroomState extends State<Guestroom> {
  String? selectedHall;
  DateTime? arrivalDate;
  DateTime? departureDate;
  TimeOfDay? arrivalTime;
  TimeOfDay? departureTime;
  int? numOfGuests;
  String? nationality;
  int? numOfRooms;
  String? roomType;
  String? guestName;
  String? guestAddress;
  String? guestEmail;
  String? guestPhoneNumber;
  bool availableRoom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guest Room'),
        backgroundColor: const Color.fromARGB(255, 245, 103, 47),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Book Guest Room',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                DropdownButtonFormField<String>(
                  value: selectedHall,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedHall = newValue;
                    });
                  },
                  items: <String>['1', '2', '3', '4'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text('Hall $value'),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Hall',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Arrival Date',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != arrivalDate) {
                      setState(() {
                        arrivalDate = picked;
                      });
                    }
                  },
                  controller: TextEditingController(
                    text: arrivalDate != null
                        ? "${arrivalDate!.day}/${arrivalDate!.month}/${arrivalDate!.year}"
                        : "",
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Departure Date',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != departureDate) {
                      setState(() {
                        departureDate = picked;
                      });
                    }
                  },
                  controller: TextEditingController(
                    text: departureDate != null
                        ? "${departureDate!.day}/${departureDate!.month}/${departureDate!.year}"
                        : "",
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Arrival Time',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null && picked != arrivalTime) {
                      setState(() {
                        arrivalTime = picked;
                      });
                    }
                  },
                  controller: TextEditingController(
                    text: arrivalTime != null
                        ? "${arrivalTime!.hour}:${arrivalTime!.minute}"
                        : "",
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Departure Time',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null && picked != departureTime) {
                      setState(() {
                        departureTime = picked;
                      });
                    }
                  },
                  controller: TextEditingController(
                    text: departureTime != null
                        ? "${departureTime!.hour}:${departureTime!.minute}"
                        : "",
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Number of Guests',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // Parse and set the number of guests
                    setState(() {
                      numOfGuests = int.tryParse(value);
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nationality',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      nationality = value;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Number of Rooms',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // Parse and set the number of rooms
                    setState(() {
                      numOfRooms = int.tryParse(value);
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Room Type',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      roomType = value;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                SwitchListTile(
                  title: Text("Available Room"),
                  value: availableRoom,
                  onChanged: (newValue) {
                    setState(() {
                      availableRoom = newValue;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name of Guest',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      guestName = value;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Guest Address',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      guestAddress = value;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Guest Email',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      guestEmail = value;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Guest Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    setState(() {
                      guestPhoneNumber = value;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle booking logic
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text('Book New', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle cancel logic
                  },
                  icon: const Icon(Icons.close, color: Colors.white),
                  label: const Text('Cancel', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
