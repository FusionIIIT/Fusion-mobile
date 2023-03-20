import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/constants.dart';

import '../../services/service_locator.dart';
import '../../services/storage_service.dart';

class ProgrammeCurriculumHome extends StatefulWidget {
  @override
  _ProgrammeCurriculumHomeState createState() =>
      _ProgrammeCurriculumHomeState();
}

class _ProgrammeCurriculumHomeState extends State<ProgrammeCurriculumHome> {
  @override
  Widget build(BuildContext context) {
    final data = '';
    var service = locator<StorageService>();
    var name = service.profileData.user!["first_name"] +
        " " +
        service.profileData.user!["last_name"];
    var depttype = service.profileData.profile!['department']!['name'];
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            shadowColor: Colors.black,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: 170.0,
                  height: 170.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/unknown.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  //NAME OF USER
                  name,
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  depttype,
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Programme Curriculum",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                )),
              ),
              decoration: new BoxDecoration(
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 2.0,
                  )
                ],
                borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardWidget(
                data: data,
                fieldName: 'Programmes',
                url: '/programme_curriculum_home/programme',
                icon: Icons.menu_book_sharp,
              ),
              CardWidget(
                data: data,
                fieldName: 'Curriculums',
                url: '/programme_curriculum_home/curriculum',
                icon: Icons.local_library_sharp,
              ),
              CardWidget(
                data: data,
                fieldName: 'Courses',
                url: '/programme_curriculum_home/courses',
                icon: Icons.book,
              ),
              CardWidget(
                data: data,
                fieldName: 'Disciplines',
                url: '/programme_curriculum_home/discipline',
                icon: Icons.school_sharp,
              ),
              CardWidget(
                  data: data,
                  fieldName: 'Batches',
                  url: '/programme_curriculum_home/batches',
                  icon: Icons.group_work_sharp),
            ],
          )
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.data,
    required this.fieldName,
    required this.url,
    required this.icon,
  }) : super(key: key);

  final String data;
  final String fieldName;
  final String url;
  final IconData icon;
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        // border: new Border.all(
        //   color: kPrimaryColor,
        //   width: 2.0,
        //   style: BorderStyle.solid,
        // ),
        borderRadius: new BorderRadius.all(new Radius.circular(15.0)));
  }

  Text myText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
    );
  }

  Padding myContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon),
              Container(
                margin: EdgeInsets.only(left: 8.0),
                child: myText(text),
                decoration: myBoxDecoration(),
              ),
            ],
          ),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      shadowColor: Colors.black,
      child: InkWell(
        child: myContainer(fieldName),
        onTap: () {
          Navigator.pushNamed(
            context,
            url,
            arguments: data,
          );
        },
      ),
    );
  }
}
