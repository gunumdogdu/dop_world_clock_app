import 'package:dop/constants/lang.dart';
import 'package:dop/screens/dashboard_screen.dart';
import 'package:dop/screens/splash_screen.dart';
import 'package:dop/screens/thetime_screen.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'controller/themecontroller.dart';

Future<void> main() async {
  Get.put(ThemeController());
  runApp(
      // EasyLocalization(
      //   child:
      const MyApp());
  // supportedLocales: LangManager.instance.supportedLocales,
  // path: ApplicationConstants.LANG_ASSET_PATH));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('tr', 'TR'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: 'DOP',
      theme: LightTheme.data,
      darkTheme: DarkTheme.data,
      home: const SplashScreen(),
      unknownRoute:
          GetPage(name: '/notfound', page: () => const SplashScreen()),
      getPages: [
        GetPage(
          name: '/dashboard',
          page: () => DashBoardScreen(),
        ),
        GetPage(
          name: '/thetime/',
          page: () => TheTimeScreen(),
        )
      ],
    );
  }
}
