import 'package:dop/constants/size.dart';
import 'package:dop/screens/thetime_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/color.dart';
import '../constants/icons.dart';

class CityNameBar extends StatelessWidget {
  const CityNameBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 33.w),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              color: lightPrimaryColor,
            ),
            height: 54.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 18.h),
              child: Text(
                'Africa, Abidjan',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
        Positioned(
          left: null,
          right: 18.w,
          bottom: 11.h,
          top: 11.h,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const TheTimeScreen(),
                ),
              );
            },
            child: Container(
                height: 31.h,
                width: 31.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 6,
                    color: Colors.white,
                  ),
                  color: lightPrimaryColor,
                ),
                child: Transform.scale(
                  scale: 0.6,
                  child: SvgPicture.asset(
                    frontNavIcon,
                    height: 9.92.h,
                    width: 4.96.h,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
