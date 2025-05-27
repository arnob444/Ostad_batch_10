// ignore_for_file: deprecated_member_use, avoid_print

import 'package:buttonexpert/form_login.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 161, 167, 224),
      // backgroundColor: Colors.grey.shade50,
      // backgroundColor: Colors.grey.withOpacity(.3),
      appBar: AppBar(
        title: Text(
          'Ostad Flutter App',
          style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 31, 76),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                print('Its working');
              },
              child: Text('Elevated button'),
            ),
            SizedBox(height: 20),
            OutlinedButton(onPressed: () {}, child: Text('Outline button')),

            SizedBox(height: 20),
            GestureDetector(
              onDoubleTap: () {},
              onTertiaryLongPress: () {},
              onTap: () {},
              child: Text('Gesture Ditector'),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                softWrap: false,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',
              ),
            ),
            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                // obscureText: true,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Your name",
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.perm_identity),
                  suffixIcon: Icon(Icons.check_box),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 5),
              onPressed: () {
                if (nameController.text.isEmpty) {
                  print('Enter your name');
                } else if (nameController.text.length < 10) {
                  print('Enter a valid name');
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormLogin()),
                );
              },
              child: Text('Submit'),
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
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
