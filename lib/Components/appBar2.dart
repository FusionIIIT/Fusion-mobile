import 'package:flutter/material.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String curr_desig;
  final String headerTitle;

  final ValueChanged<String> onDesignationChanged;

  const CustomAppBar({
    Key? key,
    required this.curr_desig,
    required this.headerTitle,

    required this.onDesignationChanged,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  late List<String> designations;
  late String current;
  var service = locator<StorageService>();

  @override
  void initState() {
    super.initState();
    designations = (service!.getFromDisk('designations') as List<dynamic>)
        .map((dynamic item) => item.toString())
        .toList();

    current = service!.getFromDisk(
        'Current_designation'); // Ensure designations is not null before accessing index 0
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: kPrimaryColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(right: 20.0), // Add some right padding to ensure space for the dropdown
              child: Text(
                widget.headerTitle, // Example of a long title
                overflow: TextOverflow.ellipsis, // Prevents overflow by adding ellipsis
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              padding: const EdgeInsets.all(15),
              borderRadius: BorderRadius.circular(5),
              value: current,
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              iconSize: 24,
              style: TextStyle(color: Colors.white, fontSize: 18),
              dropdownColor:
              kPrimaryColor, // Set the dropdown background color to orange
              onChanged: (String? newValue) {
                widget.onDesignationChanged(newValue!);
                setState(() {
                  current = newValue!;
                  service!.saveToDisk('Current_designation', current);
                });
              },
              items: designations.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                        color: Colors.white), // Set the text color to white
                  ),
                );
              }).toList(),
              onTap: () {
                // Find the index of the selected value
                int index = designations.indexOf(current);
                // Scroll the dropdown to the selected value
                Scrollable.ensureVisible(context,
                    alignment: 0.5, duration: Duration(milliseconds: 300));
              },
            ),
          ),
        ],
      ),
      actions: <Widget>[],
    );
  }
}