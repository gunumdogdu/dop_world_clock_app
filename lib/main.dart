import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/themecontroller.dart';
import 'package:intl/intl.dart';

import 'package:dop/generated/locale_keys.g.dart';
import 'package:dop/generated/CodeGenerator.g.dart';
import 'package:dop/screens/dashboard_screen.dart';
import 'package:dop/screens/splash_screen.dart';
import 'package:dop/screens/thetime_screen.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Get.put(ThemeController());

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      startLocale: Locale('en', 'US'),
      child: MyApp(),
      assetLoader: CodegenLoader(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
// flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart SCRIPT FOR GENERATE
// flutter pub run easy_localization:generate -S assets/translations -o locale_keys.g.dart