import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For accessing platform channels
import 'package:path_provider/path_provider.dart'; // For accessing local storage directory
import 'dart:io'; // For file operations
import 'package:fusion/Components/CustomAppBar.dart';
import 'dart:convert';
import 'dart:html' as html;


class TranscriptScreen extends StatelessWidget {
  final List<Map<String, dynamic>> coursesData;
  final String studentRollNo;
  final String semester;
  final String spi;
  final String cpi;

  TranscriptScreen({
    required this.coursesData,
    required this.studentRollNo,
    required this.semester,
    required this.spi,
    required this.cpi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Transcript').buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student - $studentRollNo',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Semester - $semester',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SPI: $spi',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'CPI: $cpi',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.0),
                // ElevatedButton(
                //   onPressed: () {
                //     _printTranscript(context);
                //   },
                //   child: Text('Print'),
                // ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    _downloadTranscript();
                  },
                  child: Text('Download'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Courses',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 16.0,
                  columns: <DataColumn>[
                    DataColumn(label: Text('Course Code')),
                    DataColumn(label: Text('Subject')),
                    DataColumn(label: Text('Credits')),
                    DataColumn(label: Text('Grade')),
                  ],
                  rows: List<DataRow>.generate(
                    coursesData.length,
                    (index) => DataRow(
                      cells: [
                        DataCell(Text(
                          coursesData[index]['subject'] ?? 'N/A',
                          style: TextStyle(fontSize: 16.0),
                        )),
                        DataCell(Text(
                          coursesData[index]['course_id'] ?? 'N/A',
                          style: TextStyle(fontSize: 16.0),
                        )),
                        DataCell(Text(
                          coursesData[index]['credits']?.toString() ?? 'N/A',
                          style: TextStyle(fontSize: 16.0),
                        )),
                        DataCell(Text(
                          coursesData[index]['grade'] ?? 'N/A',
                          style: TextStyle(fontSize: 16.0),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> _printTranscript(BuildContext context) async {
  //   try {
  //     // Convert the transcript screen to a printable image
  //     final imageBytes = await _captureScreenshot(context);
  //     final ByteData bytes = ByteData.view(imageBytes.buffer);
  //     final String tempPath = (await getTemporaryDirectory()).path;

  //     // Write the image to a temporary file
  //     final File imageFile = File('$tempPath/transcript.png');
  //     await imageFile.writeAsBytes(bytes.buffer.asUint8List());

  //     // Print the image
  //     await Printing.layoutPdf(
  //       onLayout: (_) => [
  //         PdfPage(image: PrintingImageProvider(imageFile.path)),
  //       ],
  //     );
  //   } catch (e) {
  //     print('Error printing transcript: $e');
  //   }
  // }

  // Future<Uint8List> _captureScreenshot(BuildContext context) async {
  //   RenderRepaintBoundary boundary =
  //       context.findRenderObject() as RenderRepaintBoundary;
  //   final image = await boundary.toImage(pixelRatio: 3.0);
  //   ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
  //   return byteData!.buffer.asUint8List();
  // }

  // Future<void> _downloadTranscript(BuildContext context) async {
  //   try {
  //     // Get the directory for the app's documents
  //     Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  //     String appDocumentsPath = appDocumentsDirectory.path;

  //     // Create a new file in the documents directory
  //     File transcriptFile = File('$appDocumentsPath/transcript.txt');

  //     // Write transcript data to the file
  //     String transcriptContent = 'Student - $studentRollNo\n'
  //         'Semester - $semester\n'
  //         'SPI: $spi\n'
  //         'CPI: $cpi\n\n';

  //     transcriptContent += 'Course Code,Subject,Credits,Grade\n';
  //     for (int i = 0; i < coursesData.length; i++) {
  //       transcriptContent +=
  //           '${coursesData[i]['course_id']},${coursesData[i]['subject']},${coursesData[i]['credits']},${coursesData[i]['grade']}\n';
  //     }

  //     await transcriptFile.writeAsString(transcriptContent);

  //     // Show a confirmation message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Transcript downloaded successfully'),
  //       ),
  //     );
  //   } catch (e) {
  //     print('Error downloading transcript: $e');
  //   }
  // }




Future<void> _downloadTranscript() async {
  try {
    // Prepare transcript data
    String transcriptContent = 'Student - $studentRollNo\n'
        'Semester - $semester\n'
        'SPI: $spi\n'
        'CPI: $cpi\n\n';

    transcriptContent += 'Course Code,Subject,Credits,Grade\n';
    for (int i = 0; i < coursesData.length; i++) {
      transcriptContent +=
          '${coursesData[i]['course_id']},${coursesData[i]['subject']},${coursesData[i]['credits']},${coursesData[i]['grade']}\n';
    }

    // Create Blob from transcript content
    final blob = html.Blob([transcriptContent], 'text/csv');

    // Create object URL
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Create anchor element
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "Transcript_$studentRollNo.csv")
      ..click();

    // Release object URL
    html.Url.revokeObjectUrl(url);

    // Show a confirmation message
    print('Transcript downloaded successfully');
  } catch (e) {
    print('Error downloading transcript: $e');
  }
}
}
