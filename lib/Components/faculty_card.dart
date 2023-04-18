import 'package:flutter/material.dart';

class FacultyCard extends StatelessWidget {
  final String name;
  final String email;
  final String department;
  final String researchInterest;

  const FacultyCard({
    Key? key,
    required this.name,
    required this.email,
    required this.department,
    required this.researchInterest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: SizedBox(
      height: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/unknown.jpg'),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8),
              Text(
                email,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 8),
              Text(
                department,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 8),
              Text(
                researchInterest,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
