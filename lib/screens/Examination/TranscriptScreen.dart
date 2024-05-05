import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For accessing platform channels
import 'package:path_provider/path_provider.dart'; // For accessing local storage directory
import 'dart:io'; // For file operations
import 'package:fusion/Components/CustomAppBar.dart';
import 'dart:convert';

class TranscriptScreen extends StatefulWidget {
  final List<Map<String, dynamic>> coursesData;
  final String studentRollNo;
  final String semester;
  final String cpi;

  TranscriptScreen({
    required this.coursesData,
    required this.studentRollNo,
    required this.semester,
    required this.cpi,
  });

  @override
  _TranscriptScreenState createState() => _TranscriptScreenState();
}

class _TranscriptScreenState extends State<TranscriptScreen> {
  late double spi;

  @override
  void initState() {
    super.initState();
    // Calculate SPI when the screen is first rendered
    calculateSPI();
  }

  void calculateSPI() {
    double totalCredits = 0;
    double totalGradePoints = 0;

    for (var course in widget.coursesData) {
      double credits = double.parse(course['credits'].toString());
      String grade = course['grade'];

      totalCredits += credits;

      double gradePoints = 0;

      if (grade == "O") {
        gradePoints = 10;
      } else if (grade == "A+") {
        gradePoints = 10;
      } else if (grade == "A") {
        gradePoints = 9;
      } else if (grade == "B+") {
        gradePoints = 8;
      } else if (grade == "B") {
        gradePoints = 7;
      } else if (grade == "C+") {
        gradePoints = 6;
      } else if (grade == "C") {
        gradePoints = 5;
      } else if (grade == "D+") {
        gradePoints = 4;
      } else if (grade == "D") {
        gradePoints = 3;
      } else if (grade == "F") {
        gradePoints = 2;
      }

      totalGradePoints += gradePoints * credits;
    }

    // Calculate SPI
    spi = totalCredits > 0 ? (totalGradePoints / totalCredits).toDouble() : 0;
  }

  Future<void> _downloadTranscript() async {
    try {
      // Prepare transcript data
      String transcriptContent = 'Student - ${widget.studentRollNo}\n'
          'Semester - ${widget.semester}\n'
          'SPI: ${spi.toStringAsFixed(2)}\n'
          'CPI: ${widget.cpi}\n\n';

      transcriptContent += 'Course Code,Subject,Credits,Grade\n';
      for (int i = 0; i < widget.coursesData.length; i++) {
        transcriptContent +=
            '${widget.coursesData[i]['course_code']},${widget.coursesData[i]['course_id']},${widget.coursesData[i]['credits']},${widget.coursesData[i]['grade']}\n';
      }

      // Get the directory for saving the file
      final directory = await getExternalStorageDirectory();
      final file = File('${directory!.path}/Transcript_${widget.studentRollNo}.csv');

      // Write transcript content to the file
      await file.writeAsString(transcriptContent);

      // Show a confirmation message
      print('Transcript downloaded successfully');
    } catch (e) {
      print('Error downloading transcript: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transcript'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student - ${widget.studentRollNo}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Semester - ${widget.semester}',
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
                        'SPI: ${spi.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'CPI: ${widget.cpi}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: _downloadTranscript,
                  child: Text('Download Transcript'),
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
                    widget.coursesData.length,
                    (index) => DataRow(
                      cells: [
                        DataCell(Text(
                          widget.coursesData[index]['course_code'] ?? 'N/A',
                          style: TextStyle(fontSize: 16.0),
                        )),
                        DataCell(Text(
                          widget.coursesData[index]['course_id'] ?? 'N/A',
                          style: TextStyle(fontSize: 16.0),
                        )),
                        DataCell(Text(
                          widget.coursesData[index]['credits']?.toString() ??
                              'N/A',
                          style: TextStyle(fontSize: 16.0),
                        )),
                        DataCell(Text(
                          widget.coursesData[index]['grade'] ?? 'N/A',
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
}
