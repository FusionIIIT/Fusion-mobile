import 'package:pdf/widgets.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PdfService {
  Future<File> generatePdf(String reason, String name, String rollno,
      String branch, String programme) async {
    print("Reason for Bonafide: " + reason);
    final pdf = Document();

    pdf.addPage(MultiPage(
        build: (context) => <Widget>[
              Paragraph(
                  text: "To\nAssistant Registrar\nPDPM IIITDM Jabalpur",
                  style: TextStyle(fontSize: 20)),
              RichText(
                text: TextSpan(
                    text: "Subject: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                    children: [
                      TextSpan(
                          text: "Request for Bonafide Certificate. \n",
                          style: TextStyle(fontSize: 20))
                    ]),
              ),
              Text("\n\n"),
              Text("Respected Sir, \n", style: TextStyle(fontSize: 20)),
              RichText(
                  text: TextSpan(
                      text: "I, ",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                      children: [
                    TextSpan(
                        text: "$name",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: " am a ",
                    ),
                    TextSpan(
                        text: "$programme",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: " student of ",
                    ),
                    TextSpan(
                        text: "$branch",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            ", PDPM IIITDM Jabalpur. My Institute Roll Number is "),
                    TextSpan(
                        text: "$rollno",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ".\n"),
                    TextSpan(
                        text:
                            "I need a Bonafide Certificate by the Institute for "),
                    TextSpan(
                        text: "$reason",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)),
                    TextSpan(
                        text:
                            ". So, please kindly accept my request and issue me a Bonafide Certificate."),
                    TextSpan(text: "\n\n\n"),
                    TextSpan(text: "Thanking You\n"),
                    TextSpan(text: "\n"),
                    TextSpan(text: "Yours Faithfully\n"),
                    TextSpan(
                        text: "$name \n$programme ($branch)",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ]))
            ]));

    return savePdf(name: "bonafide.pdf", pdf: pdf);
  }

  Future<File> savePdf({required String name, required Document pdf}) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/$name");

    await file.writeAsBytes(bytes);

    return file;
  }

  Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
