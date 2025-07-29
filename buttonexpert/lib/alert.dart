import 'package:flutter/material.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  int age = 0;
  void showAlertDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('This is title'),
            content: Text('Are you sure ?'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    age = age + 2;
                  });
                  Navigator.pop(context);
                },
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    age = age + 5;
                  });
                  Navigator.pop(context);
                },
                child: Text('No'),
              ),
            ],
          ),
    );
  }

  void showAlertIcon() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Row(
              children: [
                // Icon(Icons.warning, color: Colors.red),
                // SizedBox(width: 10),
                Text('Warning'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.warning, color: Colors.red, size: 25),
                    SizedBox(width: 5),
                    Text('Fudie Admin', style: TextStyle(fontSize: 15)),
                  ],
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  void showSimpleDialog() {
    showDialog(
      context: context,
      builder:
          (context) => SimpleDialog(
            title: Text('Simple Dialog'),
            children: [
              SimpleDialogOption(
                child: Text('Option 1'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: Text('Option 2'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }

  void showBottomSheetAlert() {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Choose option', style: TextStyle(fontSize: 18)),
              ListTile(
                title: Text('Option 1'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('Option 2'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alert Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showAlertDialog();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: Text(
                'Alert Dialog',
                style: TextStyle(color: Colors.white),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                showSimpleDialog();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: Text(
                'Simple Dialog',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                showBottomSheetAlert();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: Text(
                'Bottom Sheet',
                style: TextStyle(color: Colors.white),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                showAlertIcon();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: Text(
                'Alert with Icon',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
