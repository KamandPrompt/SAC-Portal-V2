import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(activities());
}

class activities extends StatefulWidget {



  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<activities> {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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


          // from here add things in scroll view

          Container(
            margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
            height: 518,
            child:ListView(

                  children: [

                    // upper text container
              date_text('27','Thursday','01','22'),

            // 1st tile
            tile(),

            // 2nd tile
            tile(),

            // 3rd tile
            tile(),
        
                ],

                ),

          ),
            ],
          ),


      ),
      )
    )

    );
  }
}



// tile class declaration 

class tile extends StatefulWidget {
  

  @override
  _tileState createState() => _tileState();
}

class _tileState extends State<tile> {

 // _isFavorited takes the record of pressed button

  bool _isFavorited = false;

 // _toggleFavorite is used for toggling

  void _toggleFavorite()
  {
    setState(() {
      if(_isFavorited == true)
      {
        _isFavorited = false;
        
      }
      else{
        _isFavorited = true;
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
                      
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                            child: Column(
                            
                              children: [
                                Text('09:00',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize:23.0,color: Colors.grey, ),
                                ),
                                Text('10:00',
                                style: TextStyle(fontSize:23.0,color: Colors.grey, ),
                                ),
                              ],
                          ),
                          ),
                          SizedBox(width: 10,),
                          Card(
                            //margin: EdgeInsets.fromLTRB(0, 0, 80, 0),
                        shadowColor: Colors.brown,
                        clipBehavior: Clip.antiAlias,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff008080),Color(0xff008080)],
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
                              Row(children:[Text('Venue: Google Meet',
                                style: TextStyle(
                                    fontSize:15,color: Colors.white
                                ),
                              ),
                                SizedBox(width: 80,),
                                IconButton(

                                  icon: (_isFavorited
                                      ?  Icon(Icons.star_rounded,
                                    size: 40,
                                    color: Colors.amber,
                                  )

                                      :  Icon(
                                    Icons.star_rounded,
                                    size: 40,
                                    color: Colors.white,

                                  )
                                  ),
                                  onPressed: _toggleFavorite,
                                ),
                              ]),


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

                      ),
                        ],
                      ),

                    );
  }
}

class date_text extends StatelessWidget {

  date_text(this.date , this.week , this.month , this.year){}
  var date;
  var week;
  var month;
  var year;
  

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.fromLTRB(200, 0, 10 ,0),
              child: Row(
                children: [
                  Column(
                    // week is specified
                      children:[Text(week,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19.0,
                          color: Colors.grey,
                        ),
                      ),
                      // month and year is specified
                        Text(month+'/'+year,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19.0,
                            color: Colors.grey,
                          ),
                        ),
                      ]

                  ),
                  // date is specified
                  Text(date,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 39.0,
                      color: Colors.grey,
                    ),
                  ),

                ],
              ),
            );
  }
}