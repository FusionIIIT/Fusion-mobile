import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerFromUrl extends StatefulWidget {
  PDFViewerFromUrl({
    Key? key,
    required this.url,
    required this.label,
  }) : super(key: key);

  final String url;
  final String label;

  @override
  State<PDFViewerFromUrl> createState() => _PDFViewerFromUrlState();
}

class _PDFViewerFromUrlState extends State<PDFViewerFromUrl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${widget.label}'),
      ),
      body: SfPdfViewer.network(
        widget.url,
        onDocumentLoadFailed: (details) {
          print('[error]: $details');
          throw 'Can\'t load';
        },
      ),
    );
  }
}
