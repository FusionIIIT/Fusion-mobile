import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reimbursement Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReimbursementFormPage(),
    );
  }
}

class ReimbursementFormPage extends StatelessWidget {
  final String reimbursementFormUrl = 'https://example.com/reimbursement_form.pdf';

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reimbursement Form'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Click the button below to download the reimbursement form:',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _launchURL(reimbursementFormUrl);
              },
              child: Text('Download Form'),
            ),
          ],
        ),
      ),
    );
  }
}
