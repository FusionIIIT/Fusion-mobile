import 'package:flutter/material.dart';
import 'package:fusion/api.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class SpacsMembers extends StatefulWidget {
  const SpacsMembers({super.key});

  @override
  State<SpacsMembers> createState() => _SpacsMembersState();
}

class _SpacsMembersState extends State<SpacsMembers> {
   void initState() {
    super.initState();
   
  }
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           SizedBox(
          height: 30,
        ),
        Text('SPACS Members Details',
         style: Theme.of(context).textTheme.titleMedium,),
        
          SizedBox(
          height: 30,
        ),
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(245, 247, 249, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Icon(Icons.person),
                Text('SPACS Convener',
            
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone),
                      Text('+91-9090909090'),
                    ],
                  ),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email),
                    Text('zahid@iiitdmj.ac.in'),
                  ],
                ),
                Divider(
  color: Colors.grey,
  thickness: 2,
  indent: 20,
  endIndent: 20,
),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
         Container(
          height: 250,
             width: 250,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(245, 247, 249, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Icon(Icons.person),
                Text('SPACS Assistant',
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone),
                    Text('+91-9090898990'),
                  ],
                ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email),
                    Text('rmishra@iiitdmj.ac.in'),
                  ],
                )
            ],
          ),
        )
      ],
    );
  }
}
