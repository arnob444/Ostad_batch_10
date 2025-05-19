import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AspectRationScreen extends StatelessWidget {
  const AspectRationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 93, 189, 167),
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text(
          'Aspect Ratio',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white60),
        ),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(height: 200.h, width: 300.w, color: Colors.blueGrey),
            SizedBox(height: 20),

            FractionallySizedBox(
              widthFactor: .5,
              child: ElevatedButton(onPressed: () {}, child: Text('Submit')),
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Container(height: 100, color: Colors.pink),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(height: 100, color: Colors.pinkAccent),
                ),
              ],
            ),

            Column(
              children: [
                Container(height: 100, color: Colors.teal),
                Container(
                  height: 100,
                  color: const Color.fromARGB(255, 93, 189, 167),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                      foregroundColor: Colors.white, // Text color
                    ),
                    child: Text('Person1'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.red),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                    child: Text('Person2'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.indigo[900],
                      ),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                    child: Text('Person3'),
                  ),
                ),
              ],
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(color: Colors.blue, height: 100),
            ),
            AspectRatio(
              aspectRatio: 9 / 16,
              child: Container(
                color: const Color.fromARGB(255, 46, 75, 108),
                height: 100,
              ),
            ),
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Container(color: Colors.blueGrey, height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
