import 'dart:convert';
import 'package:get/get.dart';
import 'package:todo_list/app/core/utils/keys.dart';
import 'package:todo_list/app/data/models/task.dart';
import '../../services/stroage/services.dart';

class TaskProvider {
  final _storage = Get.find<StorageService>();

  // List<Task> readTasks() {
  //   var tasks = <Task>[];
  //   jsonDecode(_storage.read(taskKey).toString()).forEach((e) => tasks.add(Task.fromJson(e)));
  //   return tasks;
  // }

  List<Task> readTasks() {
    var data = _storage.read(taskKey);
    if (data == null) return [];
    return (jsonDecode(data.toString()) as List).map((e) => Task.fromJson(e)).toList();
  }

  void writeTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
