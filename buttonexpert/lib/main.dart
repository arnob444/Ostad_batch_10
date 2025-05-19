// import 'package:buttonexpert/home_screen.dart';
// import 'package:buttonexpert/statefull.dart';
// import 'package:buttonexpert/mediaquery.dart';
// import 'package:buttonexpert/todo_list.dart';
// import 'package:buttonexpert/aspect_ratio.dart';
import 'package:buttonexpert/aspect_ratio.dart';
import 'package:buttonexpert/drawer.dart';
import 'package:buttonexpert/form_login.dart';
import 'package:buttonexpert/new_screen.dart';
import 'package:buttonexpert/statefull.dart';
import 'package:buttonexpert/todo_list.dart';
// import 'package:buttonexpert/form_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(
  DevicePreview(
    enabled: true,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'Explore',
          // home: NewScreen(),
          home: FormLogin(),
          // home: AspectRationScreen(),
          // home: DrawerScreen(),
          // home: StatefullClass(),
          // home: TodoList(),
          // home: MediaqueryScreen(),
          // home: ListViewScreen(),
        );
      },
    );
  }
}
