import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grid View',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 4, 72, 77),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // crossAxisSpacing: 8,
          // mainAxisSpacing: 8,
        ),
        itemCount: 51,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 5),
                  Text('Send Money', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          );
        },
      ),

      //  GridView.count(
      //   crossAxisCount: 2,
      //   padding: EdgeInsets.all(8),
      //   crossAxisSpacing: 8,
      //   mainAxisSpacing: 8,
      //   children: List.generate(10, (index) {
      //     return Card(
      //       elevation: 3,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(12),
      //       ),
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Row(
      //               children: [
      //                 Icon(Icons.phone, color: Colors.blue,),
      //                 Spacer(),
      //                 Icon(Icons.delete, color: Colors.red,),
      //               ],
      //             ),
      //             SizedBox(height: 10,),
      //             Text('Arnob ', style: TextStyle(fontSize: 15),),
      //             Text('01643322115',),
      //           ],
      //         ),
      //       ),
      //     );
      //   }),
      // ),
    );
  }
}