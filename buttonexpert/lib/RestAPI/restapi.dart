import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestaAPILearn extends StatefulWidget {
  const RestaAPILearn({super.key});

  @override
  State<RestaAPILearn> createState() => _RestaAPILearnState();
}

class _RestaAPILearnState extends State<RestaAPILearn> {
  List users = [];
  bool isLoading = false;

  Future<void> fetchUsers() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(
      Uri.parse('http://jsonplaceholder.typicode.com/users'),
      headers: {'Accept': 'application/json'},
    );

    setState(() {
      isLoading = false;
    });

    log(response.body);
    if (response.statusCode == 200) {
      users = jsonDecode(response.body);
    } else {
      throw Exception('something went wrong');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Rest API',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.black,
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        user['name'][0],
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      ),
                    ),
                    title: Text(user['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          'UserName: ${user['username']}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Email: ${user['email']}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Phone: ${user['phone']}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'User address: ${user['address']['street']},  ${user['address']['city']}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Website: ${user['website']}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
