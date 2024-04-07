import 'package:flutter/material.dart';

void main() {
  runApp(GlobalStock());
}

class GlobalStock extends StatefulWidget {
  @override
  _GlobalStockState createState() => _GlobalStockState();
}

class _GlobalStockState extends State<GlobalStock> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: ItemListScreen(),
            ),
          ),
          Container(
            color: Colors.white,
            child: Center(
              child: DownloadButton(
                onPressed: () {
                  // Add your download logic here
                  print('Downloading...');
                },
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Center(
              child: ItemListScreen(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Stock',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Generate Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Add Stock',
          ),
        ],

      ),
    );
  }
}

class DownloadButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DownloadButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.download),
      label: Text('Download Report'),
    );
  }
}

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  List<Item> items = [
    Item(name: 'Computer', count: 5),
    Item(name: 'Fan', count: 3),
    Item(name: 'Table', count: 7),
    Item(name: 'Lights', count: 7),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            subtitle: Text('Count: ${items[index].count}'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _editItem(index);
              },
            ),
          );
        },
      ),
    );
  }

  void _editItem(int index) {
    // Placeholder for edit logic
    print('Editing item at index $index');
  }
}

class Item {
  final String name;
  final int count;

  Item({required this.name, required this.count});
}


