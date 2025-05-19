import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 10, 140, 150),
      appBar: AppBar(
        title: Text(
          'List View',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 4, 72, 77),
      ),

      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromARGB(255, 167, 205, 225),
            child: ListTile(
              iconColor: const Color.fromARGB(255, 4, 72, 77),
              leading: Icon(Icons.computer),
              title: Text('Arnob Das Shacha'),
              subtitle: Text('Software Engineer'),
              trailing: Icon(Icons.arrow_forward),
            ),
          );
        },
      ),

      // body: ListView(
      //   children: [
      //     Container(height: 200, width: 50, color: Colors.red),
      //     Container(height: 200, width: 50, color: Colors.blue),
      //     Container(height: 200, width: 50, color: Colors.orange),
      //     Container(height: 200, width: 50, color: Colors.greenAccent),
      //   ],
      // ),
    );
  }
}
