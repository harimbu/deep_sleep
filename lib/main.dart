import 'package:deep_sleep/binding/app_binding.dart';
import 'package:deep_sleep/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deep Sleep App',
      darkTheme: Themes.dark,
      theme: Themes.dark,
      initialBinding: AppBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
      ],
    );
  }
}
