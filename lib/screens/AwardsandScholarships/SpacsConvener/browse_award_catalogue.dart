import 'package:flutter/material.dart';
import 'package:fusion/api.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/screens/AwardsandScholarships/SpacsConvener/displaymedalcontent.dart';
import 'package:fusion/screens/AwardsandScholarships/SpacsConvener/previous_winners.dart';
import 'package:fusion/screens/AwardsandScholarships/SpacsConvener/spacs_member_details.dart';

class BrowseAwardCatalogue extends StatefulWidget {
  const BrowseAwardCatalogue({super.key});

  @override
  State<BrowseAwardCatalogue> createState() => _BrowseAwardCatalogueState();
}

class _BrowseAwardCatalogueState extends State<BrowseAwardCatalogue> {

   int currentIndex = 0;
  final List<String> buttonText = ['PreviousWinners','Catalogue','SpacsMembers'];
  // List of pages
  final List<Widget> pages = [
     PreviousWinners(),
     DisplayMedalContent(),
    SpacsMembers(),
   
  ];
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      home: Scaffold(appBar: DefaultAppBar().buildAppBar(),
          body:  SingleChildScrollView(
            child: Column(
              children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  pages.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children:[ ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  Colors.transparent,
                          elevation: 0.0,
                        ),
                        child: Text(
                          buttonText[index],
                          style: TextStyle(
                            color: currentIndex == index
                                ?  Colors.deepOrangeAccent:Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      if(currentIndex==index) Container(width: 140, height: 2, color: Colors.deepOrangeAccent),
                          
                      ]
                    ),
              
                  ),
                ),
              ),
            ),
            pages[currentIndex],
                    ],
                  ),
          ),),
    );
  }
}
