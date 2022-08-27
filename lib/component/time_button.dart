import 'package:deep_sleep/controller/play_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeButton extends StatelessWidget {
  final int index;
  final Map timeCount;
  TimeButton({Key? key, required this.index, required this.timeCount})
      : super(key: key);
  final controller = Get.find<PlayController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        onPressed: () {
          controller.toggleColor(index);
          controller.setPlayTime(index);
        },
        style: ElevatedButton.styleFrom(
          primary: controller.selectedIndex.value == index
              ? Colors.white.withOpacity(0.9)
              : Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Text(
          timeCount['name'],
          style: TextStyle(
              color: controller.selectedIndex.value == index
                  ? Colors.black
                  : Colors.grey),
        ),
      ),
    );
  }
}
