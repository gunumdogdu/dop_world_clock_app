import 'package:dop/constants/color.dart';
import 'package:dop/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Operation Services',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 15,
            color: lightSecondaryColor,
          ),
          bodySmall: TextStyle(
              color: lightSecondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w300,
              fontFamily: 'Montserrat'),
          displayMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: lightSecondaryColor,
          ),
          displayLarge: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 32,
            color: lightSecondaryColor,
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
