import 'package:assignment2/HomeScreen.dart';
import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';

void main() {
  runApp(const MyApp());
}

// void main() => runApp(
//   DevicePreview(
//     enabled: true,
//     builder: (context) => MyApp(),
//   ),
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Assignment 2',
      home: HomeScreen(),
    );
  }
}
