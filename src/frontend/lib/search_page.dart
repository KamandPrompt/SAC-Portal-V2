import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Explore Clubs and Societies in IIT Mandi',
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Programming Club", "image": "assets/images/PCLogo.png"},
    {"id": 2, "name": "STAC", "image": "assets/images/STACLogo.png"},
    {"id": 3, "name": "E-Cell", "image": "assets/images/ecellLogo.png"},
    {"id": 4, "name": "Robotronics Club", "image": "assets/images/RoboClubLogo.png"},
    {"id": 5, "name": "Yantrik Club", "image": "assets/images/YantrikLogo.png"},
    {"id": 6, "name": "Nirmaan", "image": "assets/images/NirmaanLogo.png"},
    {"id": 7, "name": "SAE", "image": "assets/images/SAELogo.png"},
    {"id": 8, "name": "Writing Club", "image": "assets/images/LitSocLogo.png"},
    {"id": 9, "name": "Debating Club", "image": "assets/images/LitSocLogo.png"},
    {"id": 10, "name": "Qurosity", "image": "assets/images/QurosityLogo.png"},
    {"id": 11, "name": "Gustaakh Saale", "image": "assets/images/DramaClubLogo.png"},
    {"id": 12, "name": "PMC", "image": "assets/images/PMCLogo.png"},
    {"id": 13, "name": "UDC", "image": "assets/images/UDCLogo.png"},
    {"id": 14, "name": "Music Club", "image": "assets/images/MusicClubLogo.png"},
    {"id": 15, "name": "Designauts", "image": "assets/images/DesignautsLogo.png"},
    {"id": 16, "name": "Art Geeks", "image": "assets/images/ArtGeeksLogo.png"},
    {"id": 17, "name": "SCRI", "image": "assets/images/SCRILogo.png"},
    {"id": 18, "name": "IEEE Student Branch", "image": "assets/images/ieeeLogo.png"},
    {"id": 19, "name": "ACM Student Chapter", "image": "assets/images/ACMLogo.png"},
    {"id": 20, "name": "ACM-W", "image": "assets/images/ACMWLogo.png"},
    {"id": 21, "name": "UG Academic Council", "image": "assets/images/UGAcadLogo.png"},
    {"id": 22, "name": "Mountain Biking Club", "image": "assets/images/mtbLogo.png"},
    {"id": 23, "name": "Hiking and Trekking Club", "image": "assets/images/hntLogo.png"},
    {"id": 24, "name": "Sports Society", "image": "assets/images/IITMandi.png"},
    {"id": 25, "name": "SnTC", "image": "assets/images/PCLogo"},
    {"id": 26, "name": "Cultural Society", "image": "assets/images/CultLogo"},
    {"id": 27, "name": "Literary Society", "image": "assets/images/LitSocLogo.png"}
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Clubs and Societies')
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Enter Club/Society Name', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? GridView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  color: Colors.black,
                  elevation: 6,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      CircleAvatar(
                        backgroundImage: AssetImage(_foundUsers[index]["image"]),
                        radius: 60,

                      ),
                      const SizedBox(height: 10),
                      Text(_foundUsers[index]["name"],
                       style: const TextStyle(
                         fontSize: 15,
                         color: Colors.white)),
                      const SizedBox(height: 10)
                    ]
                  )
                ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3
              ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
