import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/core/utils/extensions.dart';
import 'package:todo_list/app/core/values/colors.dart';
import 'package:todo_list/app/data/models/task.dart';
import 'package:todo_list/app/modules/home/controller.dart';
import 'package:todo_list/app/widgets/icons.dart';

class AddCart extends StatelessWidget {
  final _homeController = Get.find<HomeCrontroller>();
  AddCart({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            radius: 5,
            title: 'Task type',
            content: Form(
              key: _homeController.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                    child: TextFormField(
                      controller: _homeController.textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter your task title";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                    child: Wrap(
                      spacing: 2.0.wp,
                      children: icons
                          .map(
                            (e) => Obx(() {
                              final index = icons.indexOf(e);
                              return ChoiceChip(
                                selectedColor: Colors.grey[200],
                                pressElevation: 0,
                                backgroundColor: Colors.white,
                                label: e,
                                selected:
                                    _homeController.chipIndex.value == index,
                                onSelected: (bool selected) {
                                  _homeController.chipIndex.value = selected
                                      ? index
                                      : 0;
                                },
                              );
                            }),
                          )
                          .toList(),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(20),
                      ),
                      minimumSize: const Size(150, 40),
                    ),
                    onPressed: () {
                      if (_homeController.formKey.currentState!.validate()) {
                        int icon = icons[_homeController.chipIndex.value]
                            .icon!
                            .codePoint;
                        String color = icons[_homeController.chipIndex.value]
                            .color!
                            .toHex();
                        var task = Task(
                          title: _homeController.textEditingController.text,
                          icon: icon,
                          color: color,
                        );
                        Get.back();
                        _homeController.addTask(task)
                            ? EasyLoading.showSuccess("Created successfully")
                            : EasyLoading.showError('Duplicate task');
                      }
                    },
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            ),
          );
          _homeController.textEditingController.clear();
          _homeController.changeChipIndex(0);
        },
        child: DottedBorder(
          options: RectDottedBorderOptions(
            color: Colors.grey[400]!,
            dashPattern: [8, 4],
          ),
          child: Center(
            child: Icon(Icons.add, size: 10.0.wp, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
