// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Map<String, dynamic>> tasks = [];
  bool showActiveTask = true;

  void add_task(String task) {
    setState(() {
      tasks.add({'task': task, 'completed': false});
      Navigator.pop(context);
    });
  }

  void edit_task(int index, String updateTask) {
    setState(() {
      tasks[index]['task'] = updateTask;
      Navigator.pop(context);
    });
  }

  void _showDialoge({int? index}) {
    TextEditingController taskController = TextEditingController(
      text: index != null ? tasks[index]['task'] : '',
    );

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(index != null ? 'Edit task' : 'Add task'),
            content: TextField(
              controller: taskController,
              decoration: InputDecoration(hintText: "Enter Task"),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                onPressed: () {
                  if (taskController.text.trim().isNotEmpty) {
                    if (index != null) {
                      edit_task(index, taskController.text);
                    } else {
                      add_task(taskController.text);
                    }
                  }
                },
                child: Text("Save"),
              ),
            ],
          ),
    );
  }

  void toggleTaskStatus(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  // int activeCount() {
  //   return tasks.where((task) => !task['completed']).length;
  // }

  int get activeCount => tasks.where((task) => !task['completed']).length;
  int get completedCount => tasks.where((task) => task['completed']).length;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filtertasks =
        tasks.where((task) => task['completed'] != showActiveTask).toList();
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Amazing Todo App',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.blue.shade100,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    showActiveTask = true;
                  });
                },
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            activeCount.toString(),
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Active',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  setState(() {
                    showActiveTask = false;
                  });
                },
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            completedCount.toString(),
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Completed',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filtertasks.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(UniqueKey().toString()),
                  background: Container(
                    color: Colors.green,
                    child: Icon(Icons.check_box),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Icon(Icons.delete),
                  ),

                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      toggleTaskStatus(index);
                    } else {
                      deleteTask(index);
                    }
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        filtertasks[index]['task'],
                        style: TextStyle(
                          fontSize: 16,
                          decoration:
                              filtertasks[index]['completed']
                                  ? TextDecoration.lineThrough
                                  : null,
                        ),
                      ),
                      leading: Checkbox(
                        shape: CircleBorder(),
                        value: filtertasks[index]['completed'],
                        onChanged: (value) {
                          toggleTaskStatus(index);
                        },
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _showDialoge(index: index);
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialoge();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
