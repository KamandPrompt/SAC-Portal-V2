import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: page_description(),
));

class page_description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.grey[900],
      
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // photo of club 
            ClipOval(
             
              child: CircleAvatar(
                radius: 55.0,
                backgroundImage: AssetImage('assets/kamand.jpg'),
                
                
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 30.0,
              thickness: 2,
            ),
            // title of the event
            Text(
              'Intro to the Programming',
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                //fontWeight: FontWeight.bold,
                fontSize: 28.0,
                fontFamily: 'Poppins'
                //letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 15.0),
            
            // date of the event
            Row(children: [
              Icon(
                Icons.calendar_today,
                color: Colors.purple,
              ),
              SizedBox(width: 10,),
              Text('Sat, May 25, 2022',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat'
              ),)
            ],),
          // time of the event
          Container(child:Text('10:00 - 11:00',
            style: TextStyle(fontSize: 20 ,fontFamily: 'Montserrat', color: Colors.grey[600]),) ,
          margin: EdgeInsets.only(left: 33),
          ),

          SizedBox(height: 15.0,),
        // Venue of the event

          Row(children: [
              Icon(
                Icons.location_on,
                color: Colors.purple,
              ),
              SizedBox(width: 10,),
              
              Expanded(child: Text('https://meet.google.com/dont_know ',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat'
              ),),)
            ],),

            // about text

            SizedBox(height:20),
            Text('About',style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.8),
                fontSize: 28.0,
                fontFamily: 'Poppins'
                //letterSpacing: 2.0,
              )
            ,),

            
            
            //description of the event
            Expanded(
              //height: 260,
              
              child:aboutpage()),
                      
            
          ],
        ),
      ),
    );
  }
}


class aboutpage extends StatefulWidget {
  const aboutpage({Key? key}) : super(key: key);

  @override
  _aboutpage createState() => _aboutpage();
}

class _aboutpage extends State<aboutpage> {

  // bool datatype to give toggle effect to button and 
  // depending on this bool value will show full text or 
  // limit the number of line to be viewed in text.
  bool isReadmore= false;

  @override
  Widget build(BuildContext context) {
    return 
      
       ListView(
        children: [
          
          //text widget to display long text
          buildText("Read the comment in below code to understand it ( else watch above youtube tutorial Read the comment in below code to understand it ( else watch above youtube tutorial Read the comment in below code to understand it ( else watch above youtube tutorial Read the comment in below code to understand it ( else watch above youtube tutorial It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.purple),
            onPressed: (){
            setState(() {
              // toggle the bool variable true or false
              isReadmore = !isReadmore;
            });
          }, child: Text((isReadmore?'Read Less' : 'Read More')))
        ],
      );
    
  }

  Widget buildText(String text){
    
    // if read more is false then show only 3 lines from text
    // else show full text

    final lines = isReadmore ? null : 7;
    return Text(
      text,
      style: TextStyle(
                        fontSize: 20 ,
                        fontFamily: 'Montserrat', 
                        color: Colors.grey[600]),
      maxLines: lines,

      // overflow properties is used to show 3 dot in text widget
      // so that user can understand there are few more line to read.

      overflow: isReadmore ? TextOverflow.visible: TextOverflow.ellipsis,
    );
  }

}