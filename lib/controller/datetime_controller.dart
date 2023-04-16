import 'dart:convert';

import 'package:dop/screens/thetime_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DateTimeController extends GetxController {
  final TheTimeScreen cityURLController = Get.find();
  var myList = <DateTimePriv>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDateTimePriv();
  }

  Future<void> getDateTimePriv() async {
    final finalCityUrl =
        cityURLController.cityUrl; // Replace with your actual city URL
    final url = Uri.parse("http://worldtimeapi.org/api/timezone/$finalCityUrl");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final data = DateTimePriv.fromJson(jsonResponse);
        myList.add(data);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}

class DateTimePriv {
  String? datetime;

  DateTimePriv({
    required this.datetime,
  });

  DateTimePriv.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
  }
}
