import 'package:deep_sleep/controller/sound_controller.dart';
import 'package:deep_sleep/screen/play_screen.dart';
import 'package:deep_sleep/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.find<SoundController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '소리',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(horizontal: 29),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.soundItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 100 / 42,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.off(
                          () => PlayScreen(sound: controller.soundItems[index]),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Themes.darkBg,
                        ),
                        child: Center(
                          child: Text(
                            controller.soundItems[index].name,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
