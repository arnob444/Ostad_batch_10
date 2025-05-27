import 'package:buttonexpert/lifeCycleTest.dart';
import 'package:flutter/material.dart';

class Lifecycle extends StatefulWidget {
  const Lifecycle({super.key});

  @override
  State<Lifecycle> createState() => _LifecycleState();
}

class _LifecycleState extends State<Lifecycle> {
  @override
  void initState() {
    super.initState();
    print('from init state');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('LifeCycle', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 5,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Lifecycletest()),
            );
          },
          child: Text('Next Page'),
        ),
      ),
    );
  }
}


//  Flutter StatefulWidget Lifecycle Overview
// Constructor ➜ createState() ➜ initState()
//             ➜ didChangeDependencies()
//             ➜ build()
//             ➜ (widget updated?) → didUpdateWidget()
//             ➜ setState() ➜ build()
//             ➜ deactivate()
//             ➜ dispose()
