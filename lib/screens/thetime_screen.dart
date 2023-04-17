import 'package:dop/constants/color.dart';
import 'package:dop/constants/icons.dart';
import 'package:dop/constants/size.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dop/screens/dashboard_screen.dart';

import '../controller/datetime_controller.dart';

class TheTimeScreen extends StatelessWidget {
  final controller = Get.put(DateTimeController());

  TheTimeScreen({
    super.key,
    // // required this.hour,
    // // required this.minute,
    // required this.city,
    // required this.continentName,
    // // // required this.dayOfTheWeek,
    // required this.cityUrl,
    // // required this.month,
    // // required this.year,
  });

  // // String hour;
  // // String minute;
  // String continentName;
  // String city;
  // // // var dayOfTheWeek;
  // String cityUrl;

  // String month;
  @override
  Widget build(BuildContext context) {
    const comma = ', ';
    final cityF = Get.arguments['city'];

    final continentNameF = Get.arguments['continentName'];
    final citynameforURL = Get.arguments['loadCheck'];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: RefreshIndicator(
          onRefresh: () async {
            print('refreshing data...');
            await controller.fetchCityTime(citynameforURL); // refresh data
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.0,
              child: Obx(
                () => controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ))
                    : Column(
                        children: [
                          Container(
                            height: 111.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(kRadiusTopBar),
                                bottomRight: Radius.circular(kRadiusTopBar),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 60.h,
                                  bottom: null,
                                  left: 33.w,
                                  right: null,
                                  child: IconButton(
                                    onPressed: () => Get.back(),
                                    icon: Image.asset(
                                      arrowLeftPNG,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      scale: 0.6,
                                      height: 24.a,
                                      width: 24.a,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 24.h),
                                    child: Image.asset(
                                      headlineImg,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      scale: 0.6,
                                      height: 16.h,
                                      width: 149.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 140.h,
                                width: 140.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: lightSecondaryColor, width: 2),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(14),
                                  ),
                                ),
                                child: Align(
                                  child: Text(
                                    controller.cityHour.value,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 29.w,
                                    child: SvgPicture.asset(
                                      dotIcon,
                                      // ignore: deprecated_member_use
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  SizedBox(
                                    width: 29.w,
                                    child: SvgPicture.asset(
                                      dotIcon,
                                      // ignore: deprecated_member_use
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 140.h,
                                width: 140.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: lightSecondaryColor, width: 2),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(14),
                                  ),
                                ),
                                child: Align(
                                  child: Text(
                                    controller.cityMin.value,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          Column(
                            children: [
                              Text(
                                '$cityF',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                '$continentNameF',
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            children: [
                              Text(
                                controller.cityDay.value +
                                    comma +
                                    controller.cityGMT.value,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              Text(
                                controller.cityTime.value,
                                style: Theme.of(context).textTheme.displaySmall,
                              )
                            ],
                          )
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
