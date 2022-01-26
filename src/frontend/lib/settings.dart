import 'package:flutter/material.dart';

class setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('SAC Portal',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                          'https://tse1.mm.bing.net/th?id=OIP._eiPTOPDhIdzMSO6092xdwHaHa&pid=Api&P=0&w=164&h=164'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 25),
                    child: Text(
                      'Palak Sharma',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                  ),
                  Container(
                    height: 220,
                    margin: EdgeInsets.only(
                      bottom: 15,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Technical Clubs
                          Club('Programming Club'),
                          Club('Robotronics Club'),
                          Club('STAC'),
                          Club('Yantrik Club'),
                          Club('Nirmaan Club'),
                          Club('SAE Collegiate'),
                          Club('E-Cell'),

                          // Cultural clubs
                          Club('Dance Club'),
                          Club('Dramatics Club'),
                          Club('Music Club'),
                          Club('Art geeks '),
                          Club('Shutterbugs'),
                          Club('Perception'),
                          Club('Designauts'),


                          // Literary clubs
                          Club('Writing Club'),
                          Club('Quizzing Club'),
                          Club('Debating Club'),

                          // Research clubs
                          Club('SCRI'),
                          Club('IEEE Students'),
                          Club('ACM Students'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: FlatButton(
              onPressed: () {
                print('logout');
              },
              child: Text(
                'Log out',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            color: Colors.black,
          )),
    );
  }
}

class Club extends StatelessWidget {
  Club(this.clubName){}
  var clubName;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 1),
      child: ListTile(
        tileColor: Colors.black,
        leading: Icon(
          Icons.people,
          color: Colors.white,
        ),
        title: Text(
          clubName,
          style: TextStyle(
            color: Colors.white,
            wordSpacing: 1.5,
          ),
        ),
        trailing: GestureDetector(
          child: Text(
            'Unsubscribe',
            style: TextStyle(color: Colors.red,letterSpacing: 1.5,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
