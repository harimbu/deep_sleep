import 'package:deep_sleep/controller/sound_controller.dart';
import 'package:deep_sleep/controller/play_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SoundController());
    Get.put(PlayController());
  }
}
