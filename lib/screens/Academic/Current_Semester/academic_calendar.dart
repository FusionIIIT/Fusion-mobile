import 'package:flutter/material.dart';
import 'package:fusion/Components/pdf_view.dart';
import 'package:fusion/Components/tabBar_text_button.dart';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class AcademicCalendar extends StatefulWidget {
  @override
  _AcademicCalendarState createState() => _AcademicCalendarState();
}

class _AcademicCalendarState extends State<AcademicCalendar> {
  String? deptType = "";

  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    deptType = service.profileData.profile!['department']!['name'] ?? "";
  }

  String getUrl({bool commonTTurl = false}) {
    String url = 'http://' +
        getLink() +
        kAcademicProceduresCalender; //api to get calender

    return url;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: [
            TabBarTextButton(
              label: 'ACADEMIC-CALENDAR',
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (_) => PDFViewerFromUrl(
                      url: getUrl(),
                      label: 'ACADEMIC-CALENDAR',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
