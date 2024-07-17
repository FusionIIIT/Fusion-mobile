import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfService {
  Future<Uint8List> generatePdf({required pw.Widget customWidget, required String heading}) async {
    final image = (await rootBundle.load('assets/iiitdmj_logo.jpg')).buffer.asUint8List();
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context content) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Container(
                      child: pw.Image(
                        pw.MemoryImage(
                          image,
                        ),
                        width: 40,
                        height: 40,
                        ),
                      ),
                      pw.Center(
                        child: pw.Text("   IIITDMJ", style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),),
                      ),pw.Center(
                        child: pw.Text(" - $heading", style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),),
                      ),
                  ],
                )
                ),
                customWidget
              ]);
          // return pw.Center(
          //     child: pw.Text("Hello World!")
          // );
        }));
    return pdf.save();
  }

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    await OpenFile.open(filePath);
  }
}

