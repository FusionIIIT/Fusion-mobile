import 'package:flutter/material.dart';
import 'package:hrmodule/main.dart';


void main()=>runApp(EServiceApp());

class EServiceApp extends StatelessWidget {
  // const EServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EServiceBook(),
    );
  }
}

class EServiceBook extends StatelessWidget {
  // const EServiceBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E-Service Book",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 128, 128),
        leading: BackButton(
          color: Colors.white,
          onPressed: () => runApp(App()),
        ),
        actions: <Widget>[
          Icon(
            Icons.settings,
            color: Colors.white,
            size: 35.0,
          )
        ],
      ),
      body: EServiceBody(),
    );
  }
}

class EServiceBody extends StatelessWidget {
  // const EServiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {},
                autofocus: true,
                child: const Text(
                  'Personal\nDetails',
                  style: TextStyle(fontSize: 10.0),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 128, 128)))),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Lien',
                  style: TextStyle(fontSize: 10.0),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 128, 128)))),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Deputation',
                  style: TextStyle(fontSize: 10.0),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 128, 128)))),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Award',
                  style: TextStyle(fontSize: 10.0),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 128, 128)))),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Others',
                  style: TextStyle(fontSize: 10.0),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 128, 128)))),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkiIFjCOZ-mMeqxd2ryrneiHedE8G9S0AboA&usqp=CAU"))),
            ),
            Expanded(
              child: Container(
                  child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    //
                    // margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      "SU",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      "Academics",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 20.0),
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/en/1/18/Iiitdmj-logo.jpg"),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.07), BlendMode.dstATop)),
          ),
          margin: EdgeInsets.only(top: 15.0),
          child: DataTable(
              border: TableBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              columns: [
                DataColumn(
                    label: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Personal Details'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey)))),
                DataColumn(
                  label: Text(''),
                ),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('ID',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  DataCell(Text(
                    '6666',
                    style: TextStyle(color: Colors.grey[500]),
                  )),
                ]),
                DataRow(cells: [
                  DataCell(Text('Title',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  DataCell(
                      Text('Mr.', style: TextStyle(color: Colors.grey[500]))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Email',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  DataCell(Text('admin@iiitdmj.ac.in',
                      style: TextStyle(color: Colors.grey[500]))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Name',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  DataCell(
                      Text('SU', style: TextStyle(color: Colors.grey[500]))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Gender',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  DataCell(
                      Text('Male', style: TextStyle(color: Colors.grey[500]))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Date of Birth',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  DataCell(Text('Jan 1,1970',
                      style: TextStyle(color: Colors.grey[500]))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Address',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  DataCell(
                      Text('IIIT', style: TextStyle(color: Colors.grey[500]))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Phone Number',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  DataCell(Text('9999999999',
                      style: TextStyle(color: Colors.grey[500]))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Date of Joining',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  DataCell(Text('Column Type',
                      style: TextStyle(color: Colors.grey[300]))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Department',
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  DataCell(Text('Academics',
                      style: TextStyle(color: Colors.grey[500]))),
                ])
              ]),
        )
      ],
    );
  }
}