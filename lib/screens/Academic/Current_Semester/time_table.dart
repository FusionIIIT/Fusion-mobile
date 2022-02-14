import 'package:flutter/material.dart';
import 'package:fusion/Components/pdf_view.dart';
import 'package:fusion/Components/tabBar_children_with_text_button.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  String? deptType = "";

  @override
  void initState() {
    super.initState();
    var service = locator<StorageService>();
    deptType = service.profileData.profile!['department']!['name'] ?? "";
  }

  String getUrl({bool commonTTurl = false}) {
    String url = 'http://' + getLink() + "/static/academic_procedures/";
    if (commonTTurl == true) return url + 'TT_NS.pdf';
    if (deptType == 'CSE')
      url += 'TT_CSE.pdf';
    else if (deptType == 'ECE')
      url += 'TT_ECE.pdf';
    else if (deptType == 'ECE') url += 'TT_ME.pdf';
    print(url);
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              isScrollable: true,
              indicatorWeight: 4.0,
              indicatorColor: Colors.black26,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Core Courses Time table',
                ),
                Tab(
                  text: 'Common Time table',
                ),
              ],
            ),
            Flexible(
              child: TabBarView(
                children: [
                  TabBarChildrenWithTextButton(
                    label: 'VIEW TIME-TABLE',
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (_) => PDFViewerFromUrl(
                            url: getUrl(),
                            label: 'VIEW TIME-TABLE',
                          ),
                        ),
                      );
                    },
                  ),
                  TabBarChildrenWithTextButton(
                    label: 'VIEW COMMON TIME-TABLE',
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (_) => PDFViewerFromUrl(
                            url: getUrl(commonTTurl: true),
                            label: 'VIEW COMMON TIME-TABLE',
                          ),
                        ),
                      );
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
