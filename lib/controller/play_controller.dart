import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PlayController extends GetxController {
  late AudioPlayer player;
  RxBool show = true.obs;
  RxInt selectedIndex = 0.obs;
  int shortTime = 10;
  RxInt playTime = 1.obs;

  RxList<Map<String, dynamic>> times = [
    {'name': '10분', 'time': 1},
    {'name': '20분', 'time': 2},
    {'name': '30분', 'time': 3},
    {'name': '1시간', 'time': 60},
    {'name': '2시간', 'time': 120},
    {'name': '3시간', 'time': 180},
    {'name': '4시간', 'time': 240},
    {'name': '5시간', 'time': 300},
    {'name': '6시간', 'time': 360},
    {'name': '7시간', 'time': 420},
    {'name': '8시간', 'time': 480},
    {'name': '9시간', 'time': 540},
  ].obs;

  @override
  void onInit() {
    super.onInit();
    player = AudioPlayer();
  }

  void toggleShow() {
    show.value = !show.value;
  }

  void toggleColor(index) {
    selectedIndex.value = index;
  }

  void initPlaytime() {
    playTime.value = 1;
  }

  void initSelectedIndex() {
    selectedIndex.value = 0;
  }

  void setPlayTime(index) {
    playTime.value = times[index]['time'];
  }
}
