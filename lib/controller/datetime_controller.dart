import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:dop/widgets/welcome_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class DateTimeController extends GetxController {
  final langdetail = Get.put(WelcomeDetail());
  var isLoading = true.obs;
  var cityTime = ''.obs;
  var cityName = ''.obs;
  var cityGMT = ''.obs;
  var cityDay = ''.obs;
  var cityHour = ''.obs;
  var cityMin = ''.obs;
  var localeString = ''.obs;
  var newLocale = ''.obs;
  var hasError = false.obs;
  var hasData = true.obs;

  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      cityHour.value = DateFormat.H().format(DateTime.now());
      cityMin.value = DateFormat.m().format(DateTime.now());
    });
  }

  Future<void> fetchCityTime(
    String citynameforURL,
    BuildContext context,
  ) async {
    isLoading.value = true;
    hasError.value = false;
    hasData.value = false;
    try {
      final response = await http.get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$citynameforURL'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final datetime = DateTime.parse(data['datetime']).toLocal();
        String localeCode =
            Localizations.localeOf(context).toString().split('_')[0];
        cityTime.value = DateFormat('MMMM d, y', localeCode).format(datetime);
        cityDay.value = DateFormat.EEEE(localeCode).format(datetime);

        cityGMT.value = _getGMTOffset(datetime)
            .substring(0, _getGMTOffset(datetime).length - 3);
        cityHour.value = DateFormat.H().format(datetime);
        cityMin.value =
            DateFormat('mm').format(datetime); // Use 'mm' for minutes
        cityName.value = citynameforURL;

        hasData.value = true;
      } else {
        await Future.delayed(Duration(seconds: 5));
        cityTime.value = 'Error: ${response.reasonPhrase} andd';
        cityGMT.value = 'Error';
        cityDay.value = 'Error';
        cityHour.value = 'Error';
        cityMin.value = 'Error';
        hasError.value = true;
      }
    } catch (error) {
      await Future.delayed(Duration(seconds: 5));
      cityTime.value = 'Error: $error, Please pull and refresh';
      cityGMT.value = 'Error';
      cityDay.value = 'Error';
      cityHour.value = 'Error';
      cityMin.value = 'Error';
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  String _getGMTOffset(DateTime datetime) {
    Duration offset = datetime.timeZoneOffset;
    String offsetString = offset.toString().split('.').first;
    return 'GMT ${offset.isNegative ? '-' : '+'}$offsetString';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
