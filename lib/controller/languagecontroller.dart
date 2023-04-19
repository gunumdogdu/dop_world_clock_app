import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  var locale = Locale('en', 'US').obs;

  void changeLocale(Locale newLocale) {
    locale.value = newLocale;
  }
}
