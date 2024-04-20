import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final Function(Map<String, Map<String, bool>> selectedFilters) onApplyFilters;
  FilterScreen({required this.onApplyFilters});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final Map<String, Map<String, bool>> categoryFilters = {
    'CPI': {
      'Below 5.0': false,
      '5.0 - 6.0': false,
      '6.0 - 7.0': false,
      '7.0 - 8.0': false,
      '8.0 - 9.0': false,
      '9.0 - 10.0': false,
    },
    'Hostel': {
      'Hall  1': false,
      'Hall  2': false,
      'Hall  3': false,
      'Hall  4': false,
    },
    'Category': {
      'GEN': false,
      'OBC': false,
      'SC': false,
      'ST': false,
    },
  };

  String selectedCategory = 'CPI';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  categoryFilters.forEach((key, value) {
                    value.updateAll((key, value) => false);
                  });
                });
              },
              child: Text(
                'Clear Filters',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          )
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex:
                categoryFilters.keys.toList().indexOf(selectedCategory),
            onDestinationSelected: (int index) {
              setState(() {
                selectedCategory = categoryFilters.keys.toList()[index];
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: categoryFilters.keys
                .map((category) => NavigationRailDestination(
                      icon: Icon(Icons.filter_list),
                      selectedIcon: Icon(Icons.filter_list),
                      label: Text(category),
                    ))
                .toList(),
          ),
          Expanded(
              child: ListView(
            children: categoryFilters[selectedCategory]!.entries.map((entry) {
              return CheckboxListTile(
                title: Text(entry.key, style: TextStyle(color: Colors.black)),
                value: entry.value,
                onChanged: (bool? value) {
                  setState(() {
                    categoryFilters[selectedCategory]![entry.key] = value!;
                  });
                },
              );
            }).toList(),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.onApplyFilters(categoryFilters);
          Navigator.pop(context);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
