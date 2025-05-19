// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

class MediaqueryScreen extends StatefulWidget {
  const MediaqueryScreen({super.key});

  @override
  State<MediaqueryScreen> createState() => _MediaqueryScreenState();
}

class _MediaqueryScreenState extends State<MediaqueryScreen> {
  @override
  Widget build(BuildContext context) {
    Size ScreenSize = MediaQuery.of(context).size;
    // double ScreenWidth = MediaQuery.of(context).size.width;
    // double fontSize = ScreenWidth > 600 ? 32 : 18;
    double fontSize = ScreenSize.width > 600 ? 32 : 18;
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Media Query",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: Container(
        height: ScreenSize.height,
        width: ScreenSize.width,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: ScreenSize.height * .3,
                height: ScreenSize.width * .5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(12),
                  image: DecorationImage(
                    image: AssetImage('asset/profile.png'),
                  ),
                  color: Colors.brown,
                ),
              ),
            ),
            Text('This is media query', style: TextStyle(fontSize: fontSize)),
            Text('This is pixel ratio $pixelRatio'),
            SizedBox(height: 20),

            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: List.generate(12, (index) {
                return Chip(label: Text('Item $index'));
              }),
            ),

            // LayoutBuilder(
            //   builder: (context, constraints) {
            //     if (constraints.maxWidth > 600) {
            //       return GridView.count(crossAxisCount: 3);
            //     } else {
            //       return GridView.count(crossAxisCount: 1);
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
