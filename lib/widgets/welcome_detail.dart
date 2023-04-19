import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../constants/size.dart';
import '../controller/languagecontroller.dart';
import 'package:dop/generated/locale_keys.g.dart';

class WelcomeDetail extends StatelessWidget {
  WelcomeDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('H').format(now);
    String formattedTimeMin = DateFormat('mm').format(now);
    String dayMonthWeek = DateFormat('d MMMM EEEE').format(now);
    return Padding(
      padding: EdgeInsets.only(left: 33.w, top: 69.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.goodmorning,
                style: Theme.of(context).textTheme.displayMedium,
              ).tr(),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '$formattedTime : $formattedTimeMin',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                dayMonthWeek,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          SizedBox(
            width: 10.a,
          ),
          // ElevatedButton(
          //   onPressed: () async {},
          //   child: Text('dil'),
          // )
        ],
      ),
    );
  }
}
