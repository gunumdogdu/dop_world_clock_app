import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class DateTimeController extends GetxController {
  var isLoading = false.obs;
  var cityTime = ''.obs;
  var cityName = ''.obs;
  var cityGMT = ''.obs;
  var cityDay = ''.obs;
  var cityHour = ''.obs;
  var cityMin = ''.obs;
  var hasError = false.obs;

  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      cityHour.value = DateFormat.H().format(DateTime.now());
      cityMin.value = DateFormat.m().format(DateTime.now());
    });
  }

  Future<void> fetchCityTime(String citynameforURL) async {
    isLoading.value = true;
    hasError.value = false;
    try {
      final response = await http.get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$citynameforURL'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final datetime = DateTime.parse(data['datetime']).toLocal();
        cityTime.value = DateFormat('MMMM d, y').format(datetime);
        cityGMT.value = _getGMTOffset(datetime)
            .substring(0, _getGMTOffset(datetime).length - 3);
        cityDay.value = DateFormat.EEEE().format(datetime);
        cityHour.value = DateFormat.H().format(datetime);
        cityMin.value = DateFormat('MM').format(datetime);
        cityName.value = citynameforURL;
      } else {
        cityTime.value = 'Error: ${response.reasonPhrase}';
        hasError.value = true;
      }
    } catch (error) {
      cityTime.value = 'Error: $error';
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
