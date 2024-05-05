import 'package:flutter/material.dart';

class SavedIndent extends StatefulWidget {
  @override
  _SavedIndentPageState createState() => _SavedIndentPageState();
}

class _SavedIndentPageState extends State<SavedIndent> {
  // Define the list of DrawingFileInfo objects
  List<DrawingFileInfo> drawingFiles = [
    DrawingFileInfo(fileId: 1, idententItem: 'Item 1', date: '2024-02-19'),
    DrawingFileInfo(fileId: 2, idententItem: 'Item 2', date: '2024-02-18'),
    DrawingFileInfo(fileId: 3, idententItem: 'Item 3', date: '2024-02-17'),
    // Add more DrawingFileInfo objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Indents'),
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
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.edit),color:Colors.black),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete),color: Colors.redAccent),



            ],
          )
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
    title: 'Saved Indents App',
    home: SavedIndent(),
  ));
}
