import 'package:dop/constants/size.dart';
import 'package:dop/screens/thetime_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cityname_controller.dart';
import '../models/datetime_controller.dart';
import '../widgets/citynamebar.dart';
import '../widgets/search_form.dart';
import '../widgets/topbar.dart';

class DashBoardScreen extends StatelessWidget {
  final CityController cityController = Get.put(CityController());

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
                height: 30.h,
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
                        return ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          itemCount: cityController.cities.length,
                          itemBuilder: (BuildContext context, dynamic index) {
                            final city = cityController.cities[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 20.h,
                              ),
                              child: CityNameBar(
                                routeTheTimeScreen: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => TheTimeScreen(
                                            city: city.name!,
                                          )));
                                },
                                nameOf: city.name ?? '',
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
            child: const SearchForm(),
          ),
        ],
      ),
    );
  }
}
