import 'package:dop/controller/datetime_controller.dart';
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

  void _toggleLocale(BuildContext context) {
    Locale currentLocale = context.locale;
    Locale newLocale = currentLocale.languageCode == 'en'
        ? const Locale('tr', 'TR')
        : const Locale('en', 'US');
    context.setLocale(newLocale);
    Get.updateLocale(newLocale);
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('H').format(now);
    Locale currentLocale = context.locale;
    String localeString =
        '${currentLocale.languageCode}_${currentLocale.countryCode}';
    DateFormat formatter = DateFormat('d MMMM EEEE', localeString);
    String dayMonthWeek = formatter.format(now);

    String formattedTimeMin = DateFormat('mm').format(now);

    return Padding(
      padding: EdgeInsets.only(left: 33.w, top: 69.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.goodmorning,
            style: Theme.of(context).textTheme.displayMedium,
          ).tr(),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Text(
                '$formattedTime : $formattedTimeMin',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                width: 20.a,
              ),
              ElevatedButton(
                onPressed: () async {
                  _toggleLocale(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shadowColor: Theme.of(context).colorScheme.secondary,
                  elevation: 2.0,
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('button_text',
                        style: Theme.of(context).textTheme.bodyMedium)
                    .tr(),
              )
            ],
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
    );
  }
}
