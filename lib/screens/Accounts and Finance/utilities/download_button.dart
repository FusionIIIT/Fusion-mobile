import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DownloadButton extends StatefulWidget {
  final String fileUrl;
  final String fileName;
  final String title;
  Function onPress;

  DownloadButton({Key? key, required this.fileUrl, required this.fileName,required this.title,required this.onPress})
      : super(key: key);

  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool _downloading = false;

  Future<void> _downloadFile() async {
    setState(() {
      _downloading = true;
    });

    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/${widget.fileName}';

    final response = await http.get(Uri.parse(widget.fileUrl));
    if (response.statusCode == 200) {
      final file = File(filePath);
      print(file.path);
      await file.writeAsBytes(response.bodyBytes);
    }

    setState(() {
      _downloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side: BorderSide(width: 1,color: Colors.white,),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
      onPressed: _downloading ? null : _downloadFile,
      child: _downloading
          ? CircularProgressIndicator()
          : Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
    );
  }
}