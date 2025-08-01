import 'package:assignment4/ui/controllers/new_task_list_controller.dart';
import 'package:assignment4/ui/controllers/sign_in_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(SignIncontroller());
    Get.put(NewTaskListController());

  }
}