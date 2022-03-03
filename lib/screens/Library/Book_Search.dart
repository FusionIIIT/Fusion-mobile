import 'package:flutter/material.dart';
// import 'package:fusion/Components/appBar.dart';
// import 'package:fusion/Components/side_drawer.dart';

//TODO: Update Elevated Button

class BookSearch extends StatefulWidget {
  @override
  _BookSearchState createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Search'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    "Search by Book Name",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )),
                ),
                decoration: new BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  border: new Border.all(
                    color: Colors.deepOrange,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0,
                    )
                  ],
                  borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                ),
              ),
              SizedBox(height: 28),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Book Name',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Search',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                onPressed: () {
                  // Respond to button press
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.deepOrange;
                      return Colors
                          .deepOrangeAccent; // Use the component's default.
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Divider(
                  thickness: 1,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    "Search by Author Name",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )),
                ),
                decoration: new BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  border: new Border.all(
                    color: Colors.deepOrange,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0,
                    )
                  ],
                  borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                ),
              ),
              SizedBox(height: 28),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Author Name',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Search',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                onPressed: () {
                  // Respond to button press
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.deepOrange;
                      return Colors
                          .deepOrangeAccent; // Use the component's default.
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
