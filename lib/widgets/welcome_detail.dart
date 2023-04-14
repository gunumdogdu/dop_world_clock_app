import 'package:flutter/material.dart';
import '../constants/size.dart';

class WelcomeDetail extends StatelessWidget {
  const WelcomeDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            '09 : 54',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            '8 Haziran Çarşamba',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
