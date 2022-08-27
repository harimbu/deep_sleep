import 'dart:convert';

import 'package:deep_sleep/model/audio_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SoundController extends GetxController {
  RxList soundItems = [].obs;

  @override
  void onInit() {
    super.onInit();
    _getAudios();
  }

  void _getAudios() async {
    final jsonString = await rootBundle.loadString('assets/json/audio.json');
    final jsonResponse = await jsonDecode(jsonString);
    soundItems
        .addAll(jsonResponse.map((json) => AudioModel.fromJson(json)).toList());
  }
}
