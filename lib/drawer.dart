import 'package:buttonexpert/statefull.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text(
            "Drawer & TabBar",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.contact_mail), text: 'Contact'),
              Tab(icon: Icon(Icons.settings), text: 'Setting'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NameCard(
              image:
                  'https://ichef.bbci.co.uk/ace/standard/3840/cpsprodpb/7f5c/live/d265d420-de30-11ef-ac5a-93e8b29ec95c.jpg',
              person: 'Neymar JR',
            ),
            NameCard(
              image:
                  'https://assets.goal.com/images/v3/blt2aaca933046f8b00/Cristiano%20Ronaldo%20Portugal%202024%20(4).jpg',
              person: 'CR7',
            ),
            NameCard(
              image:
                  'https://static0.givemesportimages.com/wordpress/wp-content/uploads/2024/10/epl_every-record-that-lamine-yamal-holds.jpg',
              person: 'Lamine Yamal',
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Image.asset('asset/profile.png', height: 75, width: 75),
                    // CircleAvatar(
                    //   radius: 40,
                    //   backgroundImage: AssetImage('asset/profile.png'),
                    // ),
                    SizedBox(height: 12),
                    Text('Arnob Das Shacha', style: TextStyle(fontSize: 15)),
                    Text(
                      'dasarnob01@gmail.com',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              ListTile(title: Text('Home'), onTap: () {}),
              ListTile(title: Text('About'), onTap: () {}),
              ListTile(title: Text('Contact Us'), onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
