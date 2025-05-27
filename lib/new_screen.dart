import 'package:buttonexpert/aspect_ratio.dart';
import 'package:buttonexpert/drawer.dart';
import 'package:buttonexpert/grid_view.dart';
import 'package:buttonexpert/home_screen.dart';
import 'package:buttonexpert/list_view.dart';
import 'package:buttonexpert/todo_list.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  final String  name;
  const NewScreen({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Screen')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 400,
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 98, 110, 211),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(4, 4),
                            blurRadius: 5,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Text("Home Screen"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Back"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListViewScreen()),
                        );
                      },
                      child: Text("ListView"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GridViewScreen()),
                        );
                      },
                      child: Text("GridView"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TodoList()),
                        );
                      },
                      child: Text("TodoList"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DrawerScreen()),
                        );
                      },
                      child: Text("Drawer & Tabbar"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AspectRationScreen()),
                        );
                      },
                      child: Text("Aspect Ratio"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
