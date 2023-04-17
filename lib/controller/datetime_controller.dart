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
  var hasError = false.obs; // Add this variable to track API errors

  late Timer _timer; // Add a timer to update the hour every minute

  Future<void> fetchCityTime(String citynameforURL) async {
    isLoading.value = true;
    hasError.value = false; // Reset the error flag
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
        cityMin.value = DateFormat.m().format(datetime);
        cityName.value = citynameforURL;
      } else {
        cityTime.value = 'Error: ${response.reasonPhrase}';
        hasError.value =
            true; // Set the error flag if there is a problem with the API response
      }
    } catch (error) {
      cityTime.value = 'Error: $error';
      hasError.value =
          true; // Set the error flag if there is an error with the API request
    } finally {
      isLoading.value = false;
    }

    // This function will re-try fetching the data after 5 seconds
    void refetchCityTime(String citynameforURL) async {
      await Future.delayed(Duration(seconds: 5)); // Wait for 5 seconds
      if (cityTime.value.isEmpty) {
        await fetchCityTime(citynameforURL);
      }
    }

    // Call the refetchCityTime function every 5 seconds until the data is successfully fetched
    refetchCityTime(citynameforURL);
  }

  String _getGMTOffset(DateTime datetime) {
    Duration offset = datetime.timeZoneOffset;
    String offsetString = offset.toString().split('.').first;
    return 'GMT ${offset.isNegative ? '-' : '+'}$offsetString';
  }

  @override
  void dispose() {
    // Cancel the timer when the controller is disposed to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }
}
