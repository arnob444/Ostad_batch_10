import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String number;

  Contact(this.name, this.number);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  List<Contact> _contacts = [];

  void _addContact() {
    if (_nameController.text.isNotEmpty && _numberController.text.isNotEmpty) {
      setState(() {
        _contacts.add(Contact(_nameController.text, _numberController.text));
        _nameController.clear();
        _numberController.clear();
      });
    }
  }

  void del_confirm(int index) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Confirmation'),
            content: Text('Are you sure for delete?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Icon(Icons.no_cell),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _contacts.removeAt(index);
                  });
                  Navigator.pop(context);
                },
                child: Icon(Icons.delete),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Contact List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _numberController,
              decoration: InputDecoration(
                labelText: 'Number',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addContact,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.blueGrey[50],
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text(
                      _contacts[index].name,
                      style: TextStyle(color: Colors.red),
                    ),
                    subtitle: Text(_contacts[index].number),
                    trailing: Icon(Icons.phone, color: Colors.blue),
                    onLongPress: () => del_confirm(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
