import 'package:dop/screens/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/themecontroller.dart';

void main() {
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DOP',
      theme: LightTheme.data,
      darkTheme: DarkTheme.data,
      home: const SplashScreen(),
    );
  }
}
