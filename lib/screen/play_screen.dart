import 'dart:async';

import 'package:deep_sleep/component/time_button.dart';
import 'package:deep_sleep/controller/play_controller.dart';
import 'package:deep_sleep/model/audio_model.dart';
import 'package:deep_sleep/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PlayScreen extends StatefulWidget {
  final AudioModel sound;
  PlayScreen({Key? key, required this.sound}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final controller = Get.find<PlayController>();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    controller.initSelectedIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.sound.bg!),
            fit: BoxFit.cover,
          ),
        ),
        child: Obx(
          () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: controller.show.value ? 1 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.offAll(() => HomeScreen());
                          controller.initPlaytime();
                        },
                        icon: Icon(
                          Icons.home,
                          size: 36,
                        ),
                      ),
                      SizedBox(height: 80),
                      Text(
                        '시간',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: controller.times.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1 / 0.5,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (_, index) {
                            return TimeButton(
                                index: index,
                                timeCount: controller.times[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: IconButton(
                    onPressed: () async {
                      if (controller.player.playing) {
                        controller.toggleShow();
                        controller.player.stop();
                        _timer.cancel();
                        controller.initPlaytime();
                        Get.back();
                      } else {
                        await controller.player.setAsset(widget.sound.audio!);
                        controller.player.setLoopMode(LoopMode.all);
                        controller.player.play();
                        _timer =
                            Timer(Duration(minutes: controller.playTime.value),
                                () async {
                          await controller.player.stop();
                          controller.toggleShow();
                        });
                        controller.toggleShow();
                      }
                    },
                    iconSize: 50,
                    icon: Icon(
                      controller.show.value ? Icons.play_arrow : Icons.pause,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
