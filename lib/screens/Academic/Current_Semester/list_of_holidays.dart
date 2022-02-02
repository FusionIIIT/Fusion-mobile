import 'package:flutter/material.dart';
import 'package:fusion/Components/pdf_view.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:url_launcher/url_launcher.dart';

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
    String url = 'https://' +
        getLink() +
        "/static/academic_procedures/List_of_Holidays.pdf";

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
            //
            Flexible(
              child: TabBarView(
                children: [
                  tabBarChildren(
                    label: 'VIEW LIST OF HOLIDAYS',
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
                  tabBarChildren(
                    label: 'VIEW LIST OF HOLIDAYS',
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (_) => PDFViewerFromUrl(
                            url: getUrl(commonTTurl: true),
                            label: 'VIEW LIST OF HOLIDAYS',
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

  Widget tabBarChildren({String label = "", Function()? onPressed}) {
    return Center(
      child: Container(
        child: TextButton(
          onPressed: onPressed,
          child: Text('$label'),
        ),
      ),
    );
  }
}
