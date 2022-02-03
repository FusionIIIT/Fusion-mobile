import 'package:flutter/material.dart';
import 'package:fusion/Components/pdf_view.dart';
import 'package:fusion/Components/tabBar_text_button.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ExamTimeTable extends StatefulWidget {
  @override
  _ExamTimeTableState createState() => _ExamTimeTableState();
}

class _ExamTimeTableState extends State<ExamTimeTable> {
  String? deptType = "";

  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    deptType = service.profileData.profile!['department']!['name'] ?? "";
  }

  String getUrl({bool commonTTurl = false}) {
    String url = 'https://' +
        getLink() +
        "/static/academic_procedures/END_SEM_EXAM_TT.pdf";

    return url;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      initialIndex: 0,
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //
            Flexible(
              child: TabBarView(
                children: [
                  TabBarTextButton(
                    label: 'END SEM TIME TABLE',
                    onPressed: () async {
                      String url = getUrl();
                      if (await canLaunch(url)) {
                        await launch(url, forceWebView: true);
                      }

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute<dynamic>(
                      //     builder: (_) => PDFViewerFromUrl(
                      //       url: getUrl(),
                      //       label: 'VIEW TIME-TABLE',
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
