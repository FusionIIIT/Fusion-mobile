import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<Inbox> {

  List<DrawingFileInfo> drawingFiles = [
    DrawingFileInfo(fileId: 1, idententItem: 'Item 1', date: '2024-02-19'),
    DrawingFileInfo(fileId: 2, idententItem: 'Item 2', date: '2024-02-18'),
    DrawingFileInfo(fileId: 3, idententItem: 'Item 3', date: '2024-02-17'),
    // Add more DrawingFileInfo objects as needed
  ];
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.deepOrangeAccent,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.builder(
        itemCount: drawingFiles.length,
        itemBuilder: (context, index) {
          final drawingFile = drawingFiles[index];
          return DrawingFile(
            fileId: drawingFile.fileId,
            idententItem: drawingFile.idententItem,
            date: drawingFile.date,
            index: index,
          );
        },
      ),
    );
  }
}


class DrawingFile extends StatelessWidget {
  final int fileId;
  final String idententItem;
  final String date;
  final int index;

  DrawingFile({
    required this.fileId,
    required this.idententItem,
    required this.date,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final  data="";
    // Determine background color based on index
    Color backgroundColor = index.isOdd ? Colors.grey[200]! : Colors.white;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(width: 1.0, color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'File Id: $fileId',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Identent Item: $idententItem',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Date: $date',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              // Add your onPressed callback here
              Navigator.pushNamed(
                context,
                '/purchase_store/indent_view',
                arguments: data,
              );
            },
            child: Text('View'),
          ),
        ],
      ),
    );
  }
}

class DrawingFileInfo {
  final int fileId;
  final String idententItem;
  final String date;

  DrawingFileInfo({
    required this.fileId,
    required this.idententItem,
    required this.date,
  });
}

void main() {
  runApp(MaterialApp(
    title: ' Inbox App',
    home: Inbox(),
  ));
}
