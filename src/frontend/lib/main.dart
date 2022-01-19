import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{

  runApp(MaterialApp(
    home: Home(),
  ),);
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final variable = Card(
    shadowColor: Colors.brown,
    clipBehavior: Clip.antiAlias,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    child: Container(

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff00A8A8),Color(0xff0C6980)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Intro to the Programming',
          style:TextStyle(color:Colors.white,fontSize: 20),
          ),
          SizedBox(height: 30,),

          Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,

            ),
          ),

          SizedBox(height: 20,),
          Text('Venue: Google Meet',
          style: TextStyle(
            fontSize:15,color: Colors.white
          ),
          ),
          SizedBox(height: 10,),
          Text('Host: Programming Club',
            style: TextStyle(
                fontSize:15,color: Colors.white
            ),
          ),
          SizedBox(height: 10,),

        ],
      ),
    ),
  );






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(170, 0, 0 ,0),
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Text(
              'Activities',
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(275, 0, 0 ,0),
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Text(
              'All',
              style: TextStyle(
                fontSize: 34.0,
                color: Colors.grey,
              ),
            ),
          ),
          Divider(
            height: 25.0,
            thickness: 2,
            color: Colors.grey,
            indent: 25,
            endIndent: 24,
          ),

          Container(
            margin: EdgeInsets.fromLTRB(80, 0, 10, 0),
            child: Column(
              children: [
                Container(
                margin: EdgeInsets.fromLTRB(185, 0, 10 ,0),
                  child: Row(
                    children: [
                      Column(
                          children:[Text('Tue',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19.0,
                              color: Colors.grey,
                            ),
                          ),
                            Text('06/21',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.0,
                                color: Colors.grey,
                              ),
                            ),
                          ]

                      ),
                      Text('18',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 39.0,
                        color: Colors.grey,
                      ),
                      ),

                    ],
                  ),
                ),
                Container(
                  child: variable,
                ),

                Icon(
                  Icons.star_border_rounded,
                  size: 80,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star_rounded,
                  size: 80,
                  color: Colors.amber,
                ),

                IconButton(onPressed: ,
                    icon: Icons.star)
                ],
                ),
                ),

              ],
            ),
          ),


      )
    );



  }
}