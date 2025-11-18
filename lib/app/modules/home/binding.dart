import 'package:get/get.dart';
import 'package:todo_list/app/data/providers/task/provider.dart';
import 'package:todo_list/app/data/services/stroage/repository.dart';
import 'package:todo_list/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeCrontroller(
        taskRepository: TaskRepository(taskProvider: TaskProvider()),
      ),
    );
  }
}
