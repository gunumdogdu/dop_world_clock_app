import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CityController extends GetxController {
  var cities = <CityNames>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCityNames();
  }

  Future<void> getCityNames() async {
    final prefs = await SharedPreferences.getInstance();
    final citiesJson = prefs.getString('cities');

    if (citiesJson != null) {
      final citiesList = (jsonDecode(citiesJson) as List<dynamic>)
          .map((e) => CityNames.fromJson(e as Map<String, dynamic>))
          .toList();
      cities.value = citiesList;
    } else {
      try {
        final response = await http.get(
          Uri.parse('http://worldtimeapi.org/api/timezone'),
        );
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          List<CityNames> citiesList = [];

          for (var i = 0; i < jsonResponse.length; i++) {
            CityNames cityAll = CityNames(name: jsonResponse[i]);
            citiesList.add(cityAll);
          }

          final citiesJson = jsonEncode(citiesList);
          await prefs.setString('cities', citiesJson);

          cities.value = citiesList;
        } else {
          throw Exception('Failed to retrieve data');
        }
      } catch (e) {
        // Handle error and try again
        print('Error fetching city names: $e');
        await Future.delayed(Duration(seconds: 5));
        await getCityNames();
      }
    }
  }
}

class CityNames {
  final String? name;

  CityNames({required this.name});

  CityNames.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {'name': name};
}
