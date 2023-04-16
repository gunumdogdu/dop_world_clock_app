import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CityController extends GetxController {
  var cities = <CityNames>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCityNames();
  }

  Future<void> getCityNames() async {
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
      cities.value = citiesList;
    } else {
      throw Exception('Failed to retrieve data');
    }
  }
}

class CityNames {
  final String? name;

  CityNames({required this.name});

  CityNames.fromJson(Map<String, dynamic> json) : name = json['name'];
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'citynames.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   final CityController cityController = Get.put(CityController());

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Api Deneme'),
//         ),
//         body: Center(
//           child: Obx(() {
            // if (cityController.cities.isEmpty) {
            //   return const CircularProgressIndicator();
            // } else {
//               return ListView.builder(
//                 itemCount: cityController.cities.length,
//                 itemBuilder: (context, index) {
//                   final city = cityController.cities[index];
//                   return ListTile(
//                     title: Text(city.name ?? ''),
//                   );
//                 },
//               );
//             }
//           }),
//         ),
//       ),
//     );
//   }
// }

