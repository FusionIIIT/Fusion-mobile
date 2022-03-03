import 'package:flutter/material.dart';
import 'package:fusion/Components/pdf_view.dart';
import 'package:fusion/Components/tabBar_children_with_text_button.dart';
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class HolidaysList extends StatefulWidget {
  @override
  _HolidaysListState createState() => _HolidaysListState();
}

class _HolidaysListState extends State<HolidaysList> {
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
        kAcademicProceduresHolidaysTT; //API endpoint for holiday list

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
            TabBarChildrenWithTextButton(
              label: 'VIEW LIST OF HOLIDAYS',
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (_) => PDFViewerFromUrl(
                      url: getUrl(),
                      label: 'VIEW LIST OF HOLIDAYS',
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
