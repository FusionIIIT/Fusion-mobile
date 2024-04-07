import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';

class NewRequest extends StatefulWidget {
  @override
  _NewRequestPageState createState() => _NewRequestPageState();
}

class _NewRequestPageState extends State<NewRequest> {
  List<DrawingFileInfo> drawingFiles = [
    DrawingFileInfo(fileId: 1, idententItem: 'Item 1', date: '2024-02-19',subject :'Order for a new Computer',from:'Hritik Ranjan'),
    DrawingFileInfo(fileId: 1, idententItem: 'Item 1', date: '2024-02-19',subject :'Order for a new Computer',from:'Hritik Ranjan'),
    DrawingFileInfo(fileId: 1, idententItem: 'Item 1', date: '2024-02-19',subject :'Order for a new Computer',from:'Hritik Ranjan')
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
      appBar:AppBar(
        title: Text('New Request'), // Add your title here
        // You can customize other properties of the AppBar as needed
        backgroundColor: Colors.deepOrangeAccent,
        // Add other properties like actions, leading, etc. if needed
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
            subject:drawingFile.subject,
            from: drawingFile.from,

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
  final String subject;
  final String from;


  DrawingFile({
    required this.fileId,
    required this.idententItem,
    required this.date,
    required this.index,
    required this.subject,
    required this.from
  });

  @override
  Widget build(BuildContext context) {
    final data='';
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
            '$subject',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'from: $from',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Date: $date',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/purchase_store/indent_view',
                arguments: data,
              );
              print('Open form');
            },
            child: Text(
              'Open Form',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF36C35)),
            ),
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
  final String subject;
  final String from;

  DrawingFileInfo({
    required this.fileId,
    required this.idententItem,
    required this.date,
    this.subject = '', // Provide a default value for subject
    this.from = '', // Provide a default value for from
  });
}

void main() {
  runApp(MaterialApp(
    title: 'NewRequest',
    home: NewRequest(),
  ));
}
