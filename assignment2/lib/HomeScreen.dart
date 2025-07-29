import 'package:assignment2/FlagCard.dart';
import 'package:assignment2/model/flag.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Flag> flags = [
    Flag(title: "Bangladesh", subtitle: "See More", flagAsset: "asset/bd.png"),
    Flag(title: "France", subtitle: "See More", flagAsset: "asset/france1.png"),
    Flag(title: "Germany", subtitle: "See More", flagAsset: "asset/germany.png",),
    Flag(title: "Australia", subtitle: "See More", flagAsset: "asset/aus.png"),
    Flag(title: "Spain", subtitle: "See More", flagAsset: "asset/spain.png"),
    Flag(title: "USA", subtitle: "See More", flagAsset: "asset/usa.png"),
    Flag(title: "Italy", subtitle: "See More", flagAsset: "asset/italy.png"),
    Flag(title: "Japan", subtitle: "See More", flagAsset: "asset/japan.png"),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;

    if (screenWidth < 768) {
      crossAxisCount = 2;
    } else if (screenWidth <= 1024) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 4;
    }

    return Scaffold(
      backgroundColor: Color(0xFFF9F9FA),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 66, 53),
        title: const Text(
          'Countries Flag',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 15,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.65,
          ),
          itemCount: flags.length,
          itemBuilder: (context, index) {
            return FlagCard(flag: flags[index]);
          },
        ),
      ),
    );
  }
}
