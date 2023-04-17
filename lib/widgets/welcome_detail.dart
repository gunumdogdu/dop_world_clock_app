import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/size.dart';

class WelcomeDetail extends StatelessWidget {
  const WelcomeDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('hh').format(now);
    String formattedTimeMin = DateFormat('mm').format(now);
    String dayMonthWeek = DateFormat('d MMMM EEEE').format(now);
    return Padding(
      padding: EdgeInsets.only(left: 33.w, top: 69.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Günaydın, Özgür!',
            style: Theme.of(context).textTheme.displayMedium,
          ),
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
    );
  }
}
