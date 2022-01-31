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

          Expanded(
           // margin: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            
           // height: 518,
            
            child:ListView(

                  children: [

                    // upper text container
              date_text('27','Thursday','01','22'),

            // 1st tile
            tile(),
           

            // 2nd tile

            tile(),
            date_text('27','Thursday','01','22'),
            tile(), tile(),
            
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
    return Padding(
        padding: const EdgeInsets.fromLTRB(80.0, 20, 30.0, 40),
        child: Column(
          
          children: <Widget>[
            
           
            Container(
              
              
              padding: EdgeInsets.fromLTRB(5, 10, 4, 0),
              decoration: BoxDecoration(
                boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 7,
        offset: Offset(2, 3), //changes position of shadow
      ),
    ],
                color:Color(0xff008080),
                borderRadius: BorderRadius.all(
                Radius.circular(24.0),
              ),
              ),
              child:Column(children: [
                // Title 
                Container(  
                  padding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                      child:
                      Align(alignment:Alignment.topLeft,
                      child: Text(
              'Intro to the Programming',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
                
                
              ),
            ) , ) 
                    ),
               
                

           SizedBox(height: 15,),
           Row(children:[
             SizedBox(width: 30,),
             //star 
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

             SizedBox(width: 160,),
             // forward icon 
             Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 50,

                      ),

                              ]),

                    SizedBox(height: 15,),
                    // Venue is mentioned
                    Container(  
                      padding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                      child:
                      Align(alignment:Alignment.topLeft,
                      child: Text('Venue: Google meet',
                                style: TextStyle(
                                    fontSize:19,color: Colors.white,
                                    
                                ),
                              ) , ) 
                    ),
                    // host is mentioned
                    Container(
                      padding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                      child:
                      Align(alignment:Alignment.topLeft,
                      child: Text('Host: Programming Club',
                                style: TextStyle(
                                    fontSize:19,color: Colors.white,
                                    
                                    
                                ),
                              ),) 
                    ),

                              
                              SizedBox(height:20),

              ],) 
            ),

          ],
        ),
      
 
    );
  }
}

// date widget
class date_text extends StatelessWidget {

  date_text(this.date , this.week , this.month , this.year){}
  var date;
  var week;
  var month;
  var year;
  

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.fromLTRB(240, 30, 10 ,0),
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


