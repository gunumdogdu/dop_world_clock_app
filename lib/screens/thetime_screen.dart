import 'package:dop/constants/color.dart';
import 'package:dop/constants/icons.dart';
import 'package:dop/constants/size.dart';
import 'package:dop/screens/dashboard_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TheTimeScreen extends StatelessWidget {
  TheTimeScreen({
    super.key,
    // required this.hour,
    // required this.minute,
    required this.city,
    // required this.continentName,
    // required this.dayOfTheWeek,
    // required this.utcOffSet,
    // required this.month,
    // required this.year,
  });

  // String hour;
  // String minute;
  // String continentName;
  String city;
  // var dayOfTheWeek;
  // String utcOffSet;
  // String month;
  // String year;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
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
                      onPressed: () {
                        Navigator.of(context).pop(
                          MaterialPageRoute(
                            builder: (_) => DashBoardScreen(),
                          ),
                        );
                      },
                      icon: Image.asset(
                        arrowLeftPNG,
                        color: Theme.of(context).colorScheme.secondary,
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
                        color: Theme.of(context).colorScheme.secondary,
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
                    border: Border.all(color: lightSecondaryColor, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: Align(
                    child: Text(
                      '13',
                      style: Theme.of(context).textTheme.titleLarge,
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
                        color: Theme.of(context).colorScheme.secondary,
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
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 140.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: lightSecondaryColor, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: Align(
                    child: Text(
                      '48',
                      style: Theme.of(context).textTheme.titleLarge,
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
                  city,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Africa',
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
                  'Çarşamba, GMT +01:00',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  'Haziran, 2023',
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
