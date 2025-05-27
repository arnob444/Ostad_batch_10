import 'package:flutter/material.dart';

class Lifecycletest extends StatefulWidget {
  const Lifecycletest({super.key});

  @override
  State<Lifecycletest> createState() => _LifecycletestState();
}

class _LifecycletestState extends State<Lifecycletest> {
  @override
  void initState() {
    print('init state from page2');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('did change dependancies');
  }

  @override
  void dispose() {
    print('dispose from page 2');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Next page")));
  }
}
