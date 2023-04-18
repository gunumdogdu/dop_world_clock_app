import 'package:dop/constants/size.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cityname_controller.dart';

import '../controller/datetime_controller.dart';
import '../controller/search_controller.dart';
import '../widgets/citynamebar.dart';
import '../widgets/search_form.dart';
import '../widgets/topbar.dart';

class DashBoardScreen extends StatelessWidget {
  final CityController cityController = Get.put(CityController());
  final controller = Get.put(DateTimeController());
  final searchController = Get.put(SearchController());
  // final DateTimeController dateTimeController = Get.put(DateTimeController());

  DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Column(
            children: [
              TopBar(),
              SizedBox(
                height: 0.1.h,
              ),
              Expanded(
                child: Builder(
                  builder: (context) => Obx(
                    () {
                      if (cityController.cities.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        final query =
                            searchController.query.value.toLowerCase();
                        final filteredCities = cityController.cities
                            .where((city) =>
                                city.name!.toLowerCase().contains(query))
                            .toList();
                        return ListView.builder(
                          itemCount: filteredCities.length,
                          itemBuilder: (context, index) {
                            final city = filteredCities[index];
                            final List<String> cityData = city.name!.split('/');
                            final citynameforURL = city.name;
                            String cityTitle = '';
                            String citySubtitle = '';
                            if (cityData.length >= 3) {
                              cityTitle = cityData[2];
                              citySubtitle = '${cityData[0]}, ${cityData[1]}';
                            } else if (cityData.length == 2) {
                              cityTitle = cityData[1];
                              citySubtitle = cityData[0];
                            } else {
                              cityTitle = cityData[0];
                            }
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 10.h,
                              ),
                              child: CityNameBar(
                                routeTheTimeScreen: () {
                                  controller
                                      .fetchCityTime(citynameforURL!); //city
                                  Get.toNamed('/thetime/', arguments: {
                                    'city': cityTitle,
                                    'loadCheck': citynameforURL,
                                    'continentName': citySubtitle,
                                  });
                                },
                                nameOf: ('$citySubtitle $cityTitle'),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 177.h,
            bottom: null,
            left: 0.w,
            right: 0.w,
            child: SearchForm(),
          ),
        ],
      ),
    );
  }
}
