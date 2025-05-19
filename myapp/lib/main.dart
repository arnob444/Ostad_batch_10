import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        darkTheme: ThemeData(primarySwatch: Colors.blue),
        color: Colors.black54,
        home: const HomeActivity());
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  MysnakeBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Ostad App',
            style: TextStyle(color: Colors.white),
          ),
          titleSpacing: 0,
          centerTitle: true,
          elevation: 3,
          shadowColor: Colors.black,
          toolbarHeight: 60,
          toolbarOpacity: 1,
          actions: [
            IconButton(
                onPressed: () {
                  MysnakeBar('this is headphone', context);
                },
                icon: const Icon(Icons.headphones))
          ]),
      floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: const Icon(Icons.add_alarm_outlined),
          onPressed: () {
            MysnakeBar('Cring Cring', context);
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Homepage'),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_emergency), label: 'Contact'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_important), label: 'Notification'),
        ],
        onTap: (int index) {
          if (index == 0) {
            MysnakeBar('Index 0', context);
          }
          if (index == 1) {
            MysnakeBar('Index 1', context);
          }
          if (index == 2) {
            MysnakeBar('Index 2', context);
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Logo')),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                MysnakeBar('Home drawer', context);
              },
            ),
            ListTile(
                leading: Icon(Icons.contact_support), title: Text('Contact')),
            ListTile(leading: Icon(Icons.email), title: Text('Email')),
            ListTile(leading: Icon(Icons.phone), title: Text('Phone')),
          ],
        ),
      ),
      // drawer: (), // left drawer
      // endDrawer: (),
      // bottomNavigationBar: (),
      // floatingActionButton: (),
    );
  }
}
