import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        border: new Border.all(
          color: Colors.black,
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: new BorderRadius.all(
            new Radius.circular(5.0)
        )
    );
  }

  Text myText(String text){
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
      ),
    );
  }

  Padding myContainer(String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myText(text),
        ),
        decoration: myBoxDecoration(),
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gymkhana Module"),
        backgroundColor: Colors.grey[900],
      ),
      body: ListView(
         scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(left: 100.0, right: 100.0),
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.black,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: new BorderRadius.all(
                      new Radius.circular(5.0)
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset('image/user-profile-icon-22.jpg',width:140,height: 120,),

                    Center(
                      child: Text(
                          "Yogendra Singh",
                          style: TextStyle(
                            fontSize: 15.0,
                          )
                      ),
                    ),
                    Center(
                        child:Text(
                          "cse student",
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child:myText("Gymkhana")),
              ),
              decoration: new BoxDecoration(
                color: Colors.orange,
                border: new Border.all(
                  color: Colors.black,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0,1.0),
                    blurRadius: 2.0,
                  )
                ],
                borderRadius: new BorderRadius.all(
                    new Radius.circular(5.0)
                ),
              ),
            ),
          ),
          InkWell(
            child: myContainer("Apply"),
            onTap: () {
              Navigator.pushNamed(context, '/first');
            },
          ),
          InkWell(
            child: myContainer("Voting Polls"),
            onTap: (){
              Navigator.pushNamed(context, '/second');
            },
          ),
          InkWell(
            child: myContainer("Club Details"),
            onTap: (){
              Navigator.pushNamed(context, '/third');
            },
          ),
          InkWell(
            child: myContainer("Members Record"),
            onTap: (){
              Navigator.pushNamed(context, '/fourth');
            },
          ),

        ],
      ),
    );
  }
}





