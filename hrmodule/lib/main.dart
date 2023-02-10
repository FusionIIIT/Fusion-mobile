import 'package:flutter/material.dart';
import 'package:hrmodule/EServiceBook/main.dart';
import 'package:hrmodule/CPDA/main.dart';
import 'package:hrmodule/LTC/main.dart';
import 'package:hrmodule/Appraisal/main.dart';
import 'package:hrmodule/Leave/main.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  // const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: HamburgerMenu(),
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 128, 128),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkiIFjCOZ-mMeqxd2ryrneiHedE8G9S0AboA&usqp=CAU"),
          )
        ],
      ),
      body: Body(),
    );
  }
}

class HamburgerMenu extends StatelessWidget {
  // const HamburgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 18, 75, 75),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            child: Row(
              children: [
                Expanded(
                    child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkiIFjCOZ-mMeqxd2ryrneiHedE8G9S0AboA&usqp=CAU"),
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      //
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "SU",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Academics",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 0.3,
          ),
          Container(
            margin: EdgeInsets.only(left: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5.0),
                  child: Text("Modules",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 15.0)),
                ),
                Container(
                  child: Icon(
                    Icons.arrow_circle_down_outlined,
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(right: 8.0),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 0.3,
          ),
          ListTile(
            title: const Text(
              'Profile',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0),
            ),
            // selected: true,
            // selectedTileColor: Colors.blue,
            onTap: () => {},
          ),
          ListTile(
            title: const Text(
              'Office of Dean Students',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0),
            ),
            // selected: true,
            // selectedTileColor: Colors.blue,
            onTap: () => {},
          ),
          ListTile(
            title: const Text(
              'Office of Dean Academics',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0),
            ),
            // selected: true,
            // selectedTileColor: Colors.blue,
            onTap: () => {},
          ),
          ListTile(
            title: const Text(
              'Director Office',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0),
            ),
            // selected: true,
            // selectedTileColor: Colors.blue,
            onTap: () => {},
          ),
          ListTile(
            title: const Text(
              'Office of Purchase Officer',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0),
            ),
            // selected: true,
            // selectedTileColor: Colors.blue,
            onTap: () => {},
          ),
          ListTile(
            title: const Text(
              'Office of Registrar',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0),
            ),
            // selected: true,
            // selectedTileColor: Colors.blue,
            onTap: () => {},
          ),
          ListTile(
            title: const Text(
              'Office of HOD{Branch}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0),
            ),
            // selected: true,
            // selectedTileColor: Colors.blue,
            onTap: () => {},
          ),
          ListTile(
            title: const Text(
              'Finance and Accounts',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0),
            ),
            // selected: true,
            // selectedTileColor: Colors.blue,
            onTap: () => {},
          ),
          ListTile(
            title: const Text(
              'Office of P & D',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0),
            ),
            // selected: true,
            // selectedTileColor: Colors.blue,
            onTap: () => {},
          ),
          ListTile(
            title: const Text(
              'Meet our team!',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0),
            ),
            // selected: true,
            // selectedTileColor: Colors.blue,
            onTap: () => {},
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                // padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(left: 20.0, top: 0),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text("Logout",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 15.0)),
                    ),
                  ],
                ),
              ),
              Container(
                // padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text("Setting",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 15.0)),
                    ),
                  ],
                ),
              ),
              Container(
                // padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(left: 20.0),

                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.help_outline,
                          size: 30, color: Colors.white),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text("Help",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 15.0)),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  // const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text(
                  "Administrative Profile",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 128, 128),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/en/1/18/Iiitdmj-logo.jpg"),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.1), BlendMode.dstATop)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(15),
                          height: 100,
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () => runApp(EServiceApp()),
                              autofocus: true,
                              child: const Text(
                                'E-Service Book',
                                style: TextStyle(fontSize: 14.0),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 0, 128, 128)))),
                        )),
                        Expanded(
                            child: Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(15),
                          child: ElevatedButton(
                              onPressed: () => runApp(CpdaApp()),
                              autofocus: true,
                              child: const Text(
                                'CPDA',
                                style: TextStyle(fontSize: 14.0),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 0, 128, 128)))),
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(15),
                          child: ElevatedButton(
                              onPressed: () =>runApp(LtcApp()),
                              autofocus: true,
                              child: const Text(
                                'LTC',
                                style: TextStyle(fontSize: 14.0),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 0, 128, 128)))),
                        )),
                        Expanded(
                            child: Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(15),
                          child: ElevatedButton(
                              onPressed: () =>runApp(AppraisalApp()),
                              autofocus: true,
                              child: const Text(
                                'Appraisal',
                                style: TextStyle(fontSize: 14.0),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 0, 128, 128)))),
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 200,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(15),
                          child: ElevatedButton(
                              onPressed: () {},
                              autofocus: true,
                              child: const Text(
                                'Leave',
                                style: TextStyle(fontSize: 14.0),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 0, 128, 128)))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                // margin: EdgeInsets.only(top: 150,right: 10),
                // color: Colors.cyan,
                height: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.help_outline,
                      size: 40,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}






